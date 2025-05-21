<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | LaptopHub</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/about.css" />
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
    <main class="about-main">
        <!-- <div class="about-logo">
            <img src="images/logo/logo1.png" alt="LaptopHub Logo">
            <h1>Laptop Hub</h1>
        </div>   -->

        <section class="about-hero">
            <h2>Get to Know Team Laptop Hub</h2>
            <p>Meet the team behind the scenes, providing technology to everyone...</p>
        </section>

        <div class="about-container">
            <section class="team-grid">
                <div class="team-card" data-member="ayush">
                    <div class="team-member">
                        <img src="${pageContext.request.contextPath}/images/avatars/ayush.png" alt="Ayush Wosti" class="member-photo">
                        <h3>Ayush</h3>
                        <p>Ayush Wosti</p>
                        <p class="role">Leader</p>
                    </div>
                </div>
                <div class="team-card" data-member="nischal">
                    <div class="team-member">
                        <img src="images/avatars/nischal.png" alt="Nischal Man Shrestha" class="member-photo">
                        <h3>Nischal</h3>
                        <p>Nischal Man Shrestha</p>
                        <p class="role">Member</p>
                    </div>
                </div>
                <div class="team-card" data-member="suave">
                    <div class="team-member">
                        <img src="images/avatars/suave.png" alt="Suave Shrestha" class="member-photo">
                        <h3>Suave</h3>
                        <p>Suave Shrestha</p>
                        <!-- h -->
                        <p class="role">Member</p>
                    </div>
                </div>
                <div class="team-card" data-member="regan">
                    <div class="team-member">
                        <img src="images/avatars/regan.png" alt="Regan Budathoki" class="member-photo">
                        <h3>Regan</h3>
                        <p>Regan Budathoki</p>
                        <p class="role">Member</p>
                    </div>
                </div>
                <div class="team-card" data-member="aasra">
                    <div class="team-member">
                        <img src="images/avatars/aasra.png" alt="Aasra Dangol" class="member-photo">
                        <h3>Aasra</h3>
                        <p>Aasra Dangol (Maharjan)</p>
                        <p class="role">Member</p>
                    </div>
                </div>
            </section>

            <section class="bio-section" id="ayush" style="display: none;">
                <img src="images/avatars/ayush.png" alt="Ayush Wosti" class="bio-photo">
                <div class="bio-content">
                    <h3>Ayush Wosti</h3>
                    <p>Ayush is the leader of the project, with a passion for technology and innovation. He leads the team with a focus on creating impactful solutions.</p>
                    <p><strong>Age:</strong>19</p>
                    <p><strong>Role:</strong>Full-Stack Developer</p>
                    <p><strong>Education:</strong>BSc(Hons) Computing</p>
                    <p><strong>College:</strong>Islington College</p>
                    <p><strong>2023-2026</strong></p>
                </div>
            </section>

            <section class="bio-section" id="nischal" style="display: none;">
                <img src="images/avatars/nischal.png" alt="Nischal Man Shrestha" class="bio-photo">
                <div class="bio-content">
                    <h3>Nischal Man Shrestha</h3>
                    <p>Nischal is a skilled developer who brings creativity and technical expertise to the team, ensuring our projects are cutting-edge.</p>
                    <p><strong>Age:</strong>19</p>
                    <p><strong>Role:</strong>QA Analyst</p>
                    <p><strong>Education:</strong>BSc(Hons) Computing</p>
                    <p><strong>College:</strong>Islington College</p>
                    <p><strong>2023-2026</strong></p>
                </div>
            </section>

            <section class="bio-section" id="suave" style="display: none;">
                <img src="images/avatars/suave.png" alt="Suave Shrestha" class="bio-photo">
                <div class="bio-content">
                    <h3>Suave Shrestha</h3>
                    <p>Suave specializes in design and user experience, making sure our products are both functional and visually appealing.</p>
                    <p><strong>Age:</strong>19</p>
                    <p><strong>Role:</strong>UI/UX Developer</p>
                    <p><strong>Education:</strong>BSc(Hons) Computing</p>
                    <p><strong>College:</strong>Islington College</p>
                    <p><strong>2023-2026</strong></p>
                </div>
            </section>

            <section class="bio-section" id="regan" style="display: none;">
                <img src="images/avatars/regan.png" alt="Regan Budathoki" class="bio-photo">
                <div class="bio-content">
                    <h3>Regan Budathoki</h3>
                    <p>Regan is our marketing expert, dedicated to spreading the word about Insight and connecting with our audience.</p>
                    <p><strong>Age:</strong>19</p>
                    <p><strong>Role:</strong>Database Handling</p>
                    <p><strong>Education:</strong>BSc(Hons) Computing</p>
                    <p><strong>College:</strong>Islington College</p>
                    <p><strong>2023-2026</strong></p>
                </div>
            </section>

            <section class="bio-section" id="aasra" style="display: none;">
                <img src="images/avatars/aasra.png" alt="Aasra Dangol" class="bio-photo">
                <div class="bio-content">
                    <h3>Aasra Dangol (Maharjan)</h3>
                    <p>Aasra is a talented project manager, keeping the team organized and ensuring we deliver on time and exceed expectations.</p>
                    <p><strong>Age:</strong>19</p>
                    <p><strong>Role:</strong>Project Manager</p>
                    <p><strong>Education:</strong>BSc(Hons) Computing</p>
                    <p><strong>College:</strong>Islington College</p>
                    <p><strong>2023-2026</strong></p>
                </div>
            </section>
            
            <section class="bio-section">
                <img src="images/avatars/ayush.png" alt="Ayush Wosti" class="bio-photo">
                <div class="bio-content">
                    <h3>Ayush Wosti</h3>
                    <p>Ayush is the leader of the project, with a passion for technology and innovation. He leads the team with a focus on creating impactful solutions.</p>
                </div>
            </section>

            <section class="bio-section">
                <img src="images/avatars/nischal.png" alt="Nischal Man Shrestha" class="bio-photo">
                <div class="bio-content">
                    <h3>Nischal Man Shrestha</h3>
                    <p>Nischal is a skilled developer who brings creativity and technical expertise to the team, ensuring our projects are cutting-edge.</p>
                </div>
            </section>

            <section class="bio-section">
                <img src="images/avatars/suave.png" alt="Suave Shrestha" class="bio-photo">
                <div class="bio-content">
                    <h3>Suave Shrestha</h3>
                    <p>Suave specializes in design and user experience, making sure our products are both functional and visually appealing.</p>
                </div>
            </section>

            <section class="bio-section">
                <img src="images/avatars/regan.png" alt="Regan Budathoki" class="bio-photo">
                <div class="bio-content">
                    <h3>Regan Budathoki</h3>
                    <p>Regan is our marketing expert, dedicated to spreading the word about Insight and connecting with our audience.</p>
                </div>
            </section>

            <section class="bio-section">
                <img src="images/avatars/aasra.png" alt="Aasra Dangol" class="bio-photo">
                <div class="bio-content">
                    <h3>Aasra Dangol (Maharjan)</h3>
                    <p>Aasra is a talented project manager, keeping the team organized and ensuring we deliver on time and exceed expectations.</p>
                </div>
            </section>
        </div>
    </main>
    
    <!-- Modal Structure -->
	<div class="modal-overlay" id="bioModal">
	    <div class="modal">
	        <span class="close-btn" id="modalClose">&times;</span>
	        <div id="modalContent"></div>
	    </div>
	</div>
	    
	<script>
		document.addEventListener("DOMContentLoaded", () => {
		    const modal = document.getElementById("bioModal");
		    const modalContent = document.getElementById("modalContent");
		    const closeBtn = document.getElementById("modalClose");
		
		    // Open modal when a team card is clicked
		    document.querySelectorAll(".team-card").forEach(card => {
		        card.addEventListener("click", () => {
		            const memberId = card.getAttribute("data-member");
		            const bioSection = document.getElementById(memberId);
		
		            if (bioSection) {
		                modalContent.innerHTML = bioSection.innerHTML;
		                modal.classList.add("active");
		            }
		        });
		    });
		
		    // Close modal
		    closeBtn.addEventListener("click", () => {
		        modal.classList.remove("active");
		    });
		
		    // Close when clicking outside the modal box
		    window.addEventListener("click", (e) => {
		        if (e.target === modal) {
		            modal.classList.remove("active");
		        }
		    });
		    
		    document.addEventListener("keydown", (e) => {
		        if (e.key === "Escape") {
		            modal.classList.remove("active");
		        }
		    });

		});
	</script>
			
	    
    <jsp:include page="footer.jsp" />
</body>
</html>