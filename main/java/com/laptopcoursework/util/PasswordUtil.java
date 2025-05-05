package com.laptopcoursework.util;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordUtil {
    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";

    private static final int TAG_LENGTH_BIT = 128; // must be one of {128, 120, 112, 104, 96}
    private static final int IV_LENGTH_BYTE = 12;
    private static final int SALT_LENGTH_BYTE = 16;
    private static final Charset UTF_8 = StandardCharsets.UTF_8;

    // Helper methods (getRandomNonce, getAESKey, getAESKeyFromPassword, etc.)

    public static byte[] getRandomNonce(int numBytes) {
        byte[] nonce = new byte[numBytes];
        new SecureRandom().nextBytes(nonce);
        return nonce;
    }

    // AES secret key
    public static SecretKey getAESKey(int keysize) throws NoSuchAlgorithmException {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(keysize, SecureRandom.getInstanceStrong());
        return keyGen.generateKey();
    }

    // Password derived AES 256 bits secret key
    public static SecretKey getAESKeyFromPassword(char[] password, byte[] salt) {
        try {
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            // iterationCount = 65536
            // keyLength = 256
            KeySpec spec = new PBEKeySpec(password, salt, 65536, 256);
            SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
            return secret;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Encrypt password
    public static String encrypt(String employee_id, String password) {
        try {
            byte[] salt = getRandomNonce(SALT_LENGTH_BYTE);
            byte[] iv = getRandomNonce(IV_LENGTH_BYTE);
            SecretKey aesKeyFromPassword = getAESKeyFromPassword(employee_id.toCharArray(), salt);

            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            cipher.init(Cipher.ENCRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));

            byte[] cipherText = cipher.doFinal(password.getBytes());

            // prefix IV and Salt to cipher text
            byte[] cipherTextWithIvSalt = ByteBuffer.allocate(iv.length + salt.length + cipherText.length)
                    .put(iv)
                    .put(salt)
                    .put(cipherText)
                    .array();

            return Base64.getEncoder().encodeToString(cipherTextWithIvSalt);
        } catch (Exception ex) {
            return null;
        }
    }

    // Decrypt password
    public static String decrypt(String encryptedPassword, String username) {
        try {
            byte[] decode = Base64.getDecoder().decode(encryptedPassword.getBytes(UTF_8));

            ByteBuffer bb = ByteBuffer.wrap(decode);
            byte[] iv = new byte[IV_LENGTH_BYTE];
            bb.get(iv);

            byte[] salt = new byte[SALT_LENGTH_BYTE];
            bb.get(salt);

            byte[] cipherText = new byte[bb.remaining()];
            bb.get(cipherText);

            SecretKey aesKeyFromPassword = PasswordUtil.getAESKeyFromPassword(username.toCharArray(), salt);

            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            cipher.init(Cipher.DECRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));

            byte[] plainText = cipher.doFinal(cipherText);

            return new String(plainText, UTF_8);
        } catch (Exception ex) {
            return null;
        }
    }

    // Verify if the entered password matches the stored password
    public static boolean verify(String enteredPassword, String storedEncryptedPassword) {
        // Decrypt the stored password using the stored encrypted password and username
        String decryptedPassword = decrypt(storedEncryptedPassword, enteredPassword);

        // If decryption is successful and the decrypted password matches the entered password
        return decryptedPassword != null && decryptedPassword.equals(enteredPassword);
    }
    

}
