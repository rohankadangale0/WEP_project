<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>CONTACT US</title>
    <link rel="icon" type="image/x-icon" href="../../Content/assets/img/mapicon.png" />

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../Content/css/stylemain.css" rel="stylesheet">

</head>
<body>

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
                               runat="server" required />
                            <div class="invalid-feedback">A name is required.</div>
                        </div>
                        <div class="form-group">
                            <!-- Email address input-->
                            <input class="form-control" id="email" type="email" placeholder="Your Email *"
                             runat="server"   required />
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
                              runat="server"  data-sb-validations="required"></textarea>
                            <div class="invalid-feedback">A message is required.
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Submit Button-->
                <div class="text-center"><button class="btn btn-warning btn-xl text-uppercase bg-warning"
                        id="submitButton" type="submit">Send Message</button></div>
            </form>
        </div>
    </section>

</body>
</html>
