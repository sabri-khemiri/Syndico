
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="fr"> <!--<![endif]-->
<head>
	<title>About Us${about.titre} </title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- Web Fonts -->
	<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/style.css">

	<!-- CSS Header and Footer -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/headers/header-default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/footers/footer-v1.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/pages/page_about.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/custom.css">

</head>

<body>
	<div class="wrapper">
             
		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left">tAbout Us ${about.titre}</h1>
			</div><!--/container-->
		</div><!--/breadcrumbs-->
		<!--=== End Breadcrumbs ===-->

		<!--=== Content Part ===-->
		<div class="container content">

			<!-- About Sldier -->
			<div class="shadow-wrapper margin-bottom-50">
				<div class="carousel slide carousel-v1 box-shadow shadow-effect-2" id="myCarousel">
					<ol class="carousel-indicators">
						<li class="rounded-x active" data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li class="rounded-x" data-target="#myCarousel" data-slide-to="1"></li>
						<li class="rounded-x" data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<div class="carousel-inner">
						<div class="item active">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/aboutus/6.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/aboutus/4.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/aboutus/10.jpg" alt="">
						</div>
					</div>

					<div class="carousel-arrow">
						<a data-slide="prev" href="#myCarousel" class="left carousel-control">
							<i class="fa fa-angle-left"></i>
						</a>
						<a data-slide="next" href="#myCarousel" class="right carousel-control">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- End About Sldier -->

			<div class="row margin-bottom-10">
				<div class="col-sm-4">
					<div class="service-block service-block-default">
						<i class="icon-custom rounded icon-color-dark icon-line icon-badge"></i>
						<h2 class="heading-md"> ${about.coaireTitre}Copropriétaires </h2>
                                                <p>${about.coaireText} Donec id elit non mi porta gravida at eget metus id elit mi egetine. Fusce dapibus. At vero eos et accusamus et iusto odio dignissimos ducimus qui.</p>
					
					</div>
				</div>
				<div class="col-sm-4">
					<div class="service-block service-block-default">
						<i class="icon-custom rounded icon-color-dark icon-line icon-fire"></i>
						<h2 class="heading-md">${about.coeteTitre} Copropriété</h2>
						<p>${about.coeteText}Donec id elit non mi porta gravida at eget metus id elit mi egetine. Fusce dapibus. At vero eos et accusamus et iusto odio dignissimos ducimus qui.</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="service-block service-block-default">
						<i class="icon-custom rounded icon-color-dark icon-line icon-directions"></i>
						<h2 class="heading-md">${about.syndicatTitre}Syndicat</h2>
						<p>${about.syndicatText} Donec id elit non mi porta gravida at eget metus id elit mi egetine. Fusce dapibus. At vero eos et accusamus et iusto odio dignissimos ducimus qui.</p>
					</div>
				</div>
			</div>
		</div>
		<!--=== End Content Part ===-->

		<!--=== Parallax About Block ===-->
		<div class="parallax-bg parallaxBg1">
			<div class="container content parallax-about">
				<div class="title-box-v2">
					<h2>${about.aPropos} Á propos<span class="color-green"> du site</span></h2>
					
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="banner-info dark margin-bottom-10">
							<i class="rounded-x fa fa-magic"></i>
							<div class="overflow-h">
								<h3>${about.but} Notre but</h3>
								<p>${about.butText} Ce site est un projet étudiant qui doit mettre en relation des copropriètaires et des copropriétés. Phasellus vitae rhoncus ipsum. Aliquam ultricies. </p>
							</div>
						</div>
						<div class="banner-info dark margin-bottom-10">
							<i class="rounded-x fa fa-magic"></i>
							<div class="overflow-h">
								<h3>${about.vision} Notre vision</h3>
								<p>${about.visionText} Phasellus vitae rhoncus ipsum. Aliquam ultricies, velit sit amet scelerisque tincidunt, dolor neque consequat est, a dictum felis metus eget nulla.</p>
							</div>
						</div>
						
						<div class="margin-bottom-20"></div>
					</div>
					<div class="col-md-6">
						<img class="img-responsive" src="${pageContext.request.contextPath}/resources/theme_1/assets/img/mockup/1.png" alt="">
					</div>
				</div>
			</div><!--/container-->
		</div>
		<!--=== End Parallax About Block ===-->

		<!--=== Container Part ===-->
		
			<!--=== Contacts === -->
			<div class="contacts content">
				
			</div>
			<!--=== End Contacts ===-->
<!--/End Wrapepr-->
                
       <!-- Javascript -->
		<!-- JS Global Compulsory -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<!-- JS Implementing Plugins -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/back-to-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/smoothScroll.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery.parallax.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/http://maps.google.com/maps/api/js?sensor=true"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/gmap/gmap.js"></script>
		<!-- JS Customization -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/custom.js"></script>
		<!-- JS Page Level -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/app.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/pages/page_contacts.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/owl-carousel.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/style-switcher.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function() {
				App.init();
				App.initParallaxBg();
				ContactPage.initMap();
				OwlCarousel.initOwlCarousel();
				StyleSwitcher.initStyleSwitcher();
			});
		</script>
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->

      <!-- /End Javascript -->
</body>
</html>

