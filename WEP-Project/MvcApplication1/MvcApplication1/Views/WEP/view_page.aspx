<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
    <head runat="server">
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>WEP</title>
            <link rel="icon" type="image/x-icon" href="../../Content/assets/img/mapicon.png" />

            <!-- Font Awesome icons (free version)-->
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <!-- Google fonts-->
            <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
            <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="../../Content/css/stylemain.css" rel="stylesheet">

        <style>
        .cards 
        {
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .cards:hover 
        {
            box-shadow: 5px 6px 6px 2px #e9ecef;
            transform: scale(1.1);
        }
        </style>

       
    </head>
    <body id="page-top">
        
           <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href='<%= Url.Action("admin_loginpage", "WEP") %>'><img src="../../Content/assets/img/mapicon.png" alt="..." /> <span class="logo">WEP</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="nav navbar-nav  collapse navbar-collapse " id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href='<%= Url.Action("loginpage", "WEP") %>'>Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container">
            <div class="masthead-subheading">Welcome To Our WEP</div>
            <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
            <a class="btn btn-warning btn-xl text-uppercase bg-warning" href='<%= Url.Action("signuppage", "WEP") %>'>Register Now</a>
        </div>
    </header>
    <!-- Services-->
    <section class="page-section" id="services">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Services</h2>
                <h3 class="section-subheading text-muted"></h3>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i><img src="../../Content/assets/img/waterdrop.png" class="img-thumbnail"
                                alt="water"></i>
                    </span>
                    <h4 class="my-3">WATER</h4>
                    <p class="text-muted">When life places stones in your path, be the water. A persistent drop of water will wear away even the hardest stone.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i><img src="../../Content/assets/img/electricity.png" class="img-thumbnail"
                            alt="water"></i>
                    </span>
                    <h4 class="my-3">ELECTRICITY</h4>
                    <p class="text-muted">Electricity can transform people's lives, not just economically but also socially.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i><img src="../../Content/assets/img/Road.png" class="img-thumbnail"
                            alt="water"></i>
                    </span>
                    <h4 class="my-3">POTHOLES</h4>
                    <p class="text-muted">Safety is 30% Common Sense, 80% Compliance and the rest is good luck.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Team-->
    <section class="page-section bg-light" id="team">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                <h3 class="section-subheading text-muted"></h3>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="team-member">
                        <img class="mx-auto rounded-circle cards" src="../../Content/assets/img/Developer_Profile/pushkar.jpg" alt="Pushkar" />
                        <h4>Pushkar Gosavi</h4>
                        <p class="text-muted">Front-End Designer</p>
                        
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.facebook.com/gosavi.pushkar18/" aria-label="Pushkar Gosavi Facebook Profile"><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.instagram.com/gosavi_pushkar18/" aria-label="Pushkar Gosavi Instagram Profile"><i
                                class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-member">
                        <img class="mx-auto rounded-circle cards" src="../../Content/assets/img/Developer_Profile/Anis.jpg" alt="ANIS" />
                        <h4>Anis Ahmed</h4>
                        <p class="text-muted">Back-End Designer</p>
                        
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.facebook.com/anisahmed33483903/"
                            aria-label="Anis Ahmed Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.instagram.com/anis_shaikh18/"
                            aria-label="Anis Ahmed LinkedIn Profile"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="team-member">
                        <img class="mx-auto rounded-circle cards" src="../../Content/assets/img/Developer_Profile/Rohan.jpeg" alt="Rohan" />
                        <h4>Rohan Kadangale</h4>
                        <p class="text-muted">Front-End Designer</p>
                        
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://m.facebook.com/100010996472832/" aria-label="Rohan Kadangale Facebook Profile"><i
                              class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.instagram.com/_ron_911/" aria-label="Rohan Kadangale LinkedIn Profile"><i
                                class="fab fa-instagram"></i></a>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="team-member">
                        <img class="mx-auto rounded-circle cards" src="../../Content/assets/img/Developer_Profile/Vaibhav.jpeg" alt="Vaibhav" />
                        <h4>Vaibhav Kamath</h4>
                        <p class="text-muted">Front-End Designer</p>
                        
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.facebook.com/vaibhav.kamath.1" aria-label="Vaibhav Kamath Facebook Profile"><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2 cards" href="https://www.instagram.com/vaibhav_1202_k/" aria-label="Vaibhav Kamath LinkedIn Profile"><i
                                class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
           
        </div>
    </section>

    <!-- Contact-->
    <section class="page-section" id="contact">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Contact Us</h2>
                <h3 class="section-subheading text-muted"> </h3>
            </div>
            
            <form runat="server" id="contactForm">

                <div class="row align-items-stretch mb-5">
                    <div class="col-md-6">
                        <div class="form-group">
                            <!-- Name input-->
                            <input class="form-control" id="name" type="text" placeholder="Your Name *"
                              runat="server"  required />
                            <div class="invalid-feedback">A name is required.</div>
                        </div>
                        <div class="form-group">
                            <!-- Email address input-->
                            <input class="form-control" id="email" type="email" placeholder="Your Email *"
                              runat="server"  required />
                            <div class="invalid-feedback">An email is required.</div>
                            <div class="invalid-feedback">Email is not valid.</div>
                        </div>
                        <div class="form-group mb-md-0">
                            <!-- Phone number input-->
                            <input class="form-control" id="phone" type="tel" placeholder="Your Phone *"
                              runat="server"  data-sb-validations="required" />
                            <div class="invalid-feedback">A phone number is required.</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group form-group-textarea mb-md-0">
                            <!-- Message input-->
                            <textarea class="form-control" id="message" placeholder="Your Message *"
                             runat="server"   data-sb-validations="required"></textarea>
                            <div class="invalid-feedback">A message is required.
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Submit Button-->
                <div class="text-center"><button class="btn btn-warning btn-xl text-uppercase bg-warning"
                        id="submitButton" type="submit" onsubmit="contactus()">Send Message</button></div>
            </form>
        </div>
    </section>

    <!-- Footer-->
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="d-flex justify-content-center">Copyright &copy; <a class="link-dark text-decoration-none me-3" href="https://wepportal.somee.com"> www.wepportal.somee.com </a>  </div>
                <div class="d-flex justify-content-center">
                    <a class="btn btn-dark btn-social mx-2 cards" href="https://twitter.com/goauniversity?lang=en" aria-label="Twitter"><i
                            class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2 cards" href="https://www.facebook.com/goauniversityofficial/" aria-label="Facebook"><i
                            class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2 cards" href="https://in.linkedin.com/company/goauniversity?original_referer=https%3A%2F%2Fwww.google.com%2F" aria-label="LinkedIn"><i
                            class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="d-flex justify-content-center">
                    <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                    <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JS-->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 

    </body>
       
    </html>
