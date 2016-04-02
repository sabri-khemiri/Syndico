<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_owner>
    <jsp:attribute name="title">${account.username}</jsp:attribute>

    <jsp:attribute name="css">
        <link href="${pageContext.request.contextPath}/resources/theme_1/assets/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_1/assets/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_1/assets/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/dataTables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/dataTables/dataTables.responsive.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/dataTables/dataTables.tableTools.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/pace/pace.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/jsKnob/jquery.knob.js"></script>

        <script>
            $(document).ready(function () {
                $('.dataCoOwnership').DataTable({
                    "dom": 'lTfigtp',
                    "tableTools": {
                        "sSwfPath": "${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
                    },
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
                    }
                });
                $(".dial").knob();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/10.jpg')">
            <div class="container">
                <h1> <spring:message code="Oawr.profile"/> </h1>
                <span> ${account.firstName} ${account.lastName} </span>
            </div>
        </div>
            <br/>

             <div class="wrapper wrapper-content">
            <div class="row">
              <div class="col-lg-1">
                                   
                </div> 
            
        </div>

        <div class="wrapper wrapper-content animated fadeInDown">
            <div class="row">
                <div class="col-lg-4">
                           
       <!-- TRAVAIL -->
 	
       <!--=== Profile ===-->
		<div class="container content profile">
			<div class="row">
				<!--Left Sidebar-->
				<div class="col-md-3 md-margin-bottom-40">
					<img class="img-responsive profile-img margin-bottom-20" src="${pageContext.request.contextPath}/resources/images/user/${account.id}${account.image}" alt="">


					<!--Notification-->
					<div class="panel-heading-v2 overflow-h">
						<h2 class="heading-xs pull-left"><i class="fa fa-bell-o"></i> --Messages récents</h2>
						<a href="#"><i class="fa fa-cog pull-right"></i></a>
					</div>
					<ul class="list-unstyled mCustomScrollbar margin-bottom-20" data-mcs-theme="minimal-dark">
						<li class="notification">
							<i class="icon-custom icon-sm rounded-x icon-bg-red icon-line icon-envelope"></i>
							<div class="overflow-h">
								<span><strong>Albert Heller</strong> has sent you email.</span>
								<small>Two minutes ago</small>
							</div>
						</li>
						<li class="notification">
							<img class="rounded-x" src="${pageContext.request.contextPath}/resources/images/owner/img6.jpg" alt="">
							<div class="overflow-h">
								<span><strong>Taylor Lee</strong> started following you.</span>
								<small>Today 18:25 pm</small>
							</div>
						</li>
						<li class="notification">
							<i class="icon-custom icon-sm rounded-x icon-bg-yellow icon-line fa fa-bolt"></i>
							<div class="overflow-h">
								<span><strong>Natasha Kolnikova</strong> accepted your invitation.</span>
								<small>Yesterday 1:07 pm</small>
							</div>
						</li>
						<li class="notification">
							<img class="rounded-x" src="${pageContext.request.contextPath}/resources/images/owner/img1.jpg" alt="">
							<div class="overflow-h">
								<span><strong>Mikel Andrews</strong> commented on your Timeline.</span>
								<small>23/12 11:01 am</small>
							</div>
						</li>
						<li class="notification">
							<i class="icon-custom icon-sm rounded-x icon-bg-blue icon-line fa fa-comments"></i>
							<div class="overflow-h">
								<span><strong>Bruno Js.</strong> added you to group chating.</span>
								<small>Yesterday 1:07 pm</small>
							</div>
						</li>
						<li class="notification">
							<img class="rounded-x" src="${pageContext.request.contextPath}/resources/images/owner/img12.jpg" alt="">
							<div class="overflow-h">
								<span><strong>Taylor Lee</strong> changed profile picture.</span>
								<small>23/12 15:15 pm</small>
							</div>
						</li>
					</ul>
					<button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Load More</button>
					<!--End Notification-->

					<div class="margin-bottom-50"></div>

					<!--Datepicker-->
					<form action="#" id="sky-form2" class="sky-form">
						<div id="inline-start"></div>
					</form>
					<!--End Datepicker-->
				</div>
				<!--End Left Sidebar-->

				<!-- Profile Content -->
				<div class="col-md-9">
					<div class="profile-body">
                                            <!--Profil-->
						<div class="profile-bio">
							<div class="row">
								<div class="col-md-5">
									<img class="img-responsive md-margin-bottom-10" src="${pageContext.request.contextPath}/resources/images/owner/10.jpg" alt="">
									<a class="btn-u btn-u-sm" href="#">Photo de la copro ^</a>
								</div>
								<div class="col-md-7">
									<span><strong>--Responsable Syndicat:</strong> Web Developer</span>
									<span><strong>--Responsable Copropriété:</strong> BLA BLA BLA</span>
									<hr>
									<p>Commentaire sur la copro !! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget massa nec turpis congue bibendum. Integer nulla felis, porta suscipit nulla et, dignissim commodo nunc. Morbi a semper nulla.</p>
									<p>Proin mauris odio, pharetra quis ligula non, vulputate vehicula quam. Nunc in libero vitae nunc ultricies tincidunt ut sed leo. Sed luctus dui ut congue consequat. Cras consequat nisl ante, nec malesuada velit pellentesque ac. Pellentesque nec arcu in ipsum iaculis convallis.</p>
								</div>
							</div>
						</div><!--/end profil-->

						<hr>

						<div class="row">
						
                                                    <!--Message-->
                                                    <div class="col-sm-6">
                                                            <div class="easy-block-v1">
                                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/owner/img12.jpg" alt="">
                                                                    <div class="easy-block-v1-badge rgba-red">--Dernier Projet</div>
                                                            </div>
                                                            <div class="projects">
                                                                    <h2><a class="color-dark" href="#">Nom du dernier Projet</a></h2>
                                                                    <ul class="list-unstyled list-inline blog-info-v2">
                                                                            <li>By: <a class="color-green" href="#">Nom du manager en charge</a></li>
                                                                            <li><i class="fa fa-clock-o"></i> Jan 02, 2013 ( date de création )</li>
                                                                    </ul>
                                                                    <p>Topo sur les détails des travaux a faire : Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                                    <br>
                                                                    <h3 class="heading-xs">--Progression du Projet <span class="pull-right">77%  ( auto incrémente )</span></h3>
                                                                    <div class="progress progress-u progress-xxs">
                                                                            <div class="progress-bar progress-bar-u" role="progressbar" aria-valuenow="77" aria-valuemin="0" aria-valuemax="100" style="width: 77%">
                                                                            </div>
                                                                    </div>
                                                                    <ul class="list-inline blog-info-v2">
                                                                            <li>
                                                                                    <strong>25</strong>
                                                                                    <span>-- Jours restants avant fin de projet</span>
                                                                            </li>
                                                                    </ul>
                                                            </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="easy-block-v1">
                                                                <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/owner/img17.jpg" alt="">
                                                                <div class="easy-block-v1-badge rgba-yellow">--Dernière Annonce</div>
                                                        </div>
                                                        <div class="projects">
                                                                <h2><a class="color-dark" href="#"> nom de la dernière Annonce</a></h2>
                                                                <ul class="list-unstyled list-inline blog-info-v2">
                                                                        <li>By: <a class="color-green" href="#">Manager ou syndicat en charge</a></li>
                                                                        <li><i class="fa fa-clock-o"></i> Jan 07, 2013  date de création</li>
                                                                        <li><i class="fa fa-clock-o"></i> Jan 07, 2013  date de fin</li>
                                                                </ul>
                                                                <p>Text de l'annonce en résumé : Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                        </div>
                                                    </div>
                                                    <!--End Message-->
                                                        
							
						</div><!--/end row-->

						<hr>

						<!--Seeting-->
						<div class="tab-v1">
							<ul class="nav nav-justified nav-tabs">
								<li class="active"><a data-toggle="tab" href="#profile">--Edition du Profil</a></li>
								<li><a data-toggle="tab" href="#passwordTab">--Changement du Mot de Passe</a></li>
							</ul>
							<div class="tab-content">
								<div id="profile" class="profile-edit tab-pane fade in active">
									<h2 class="heading-md">Gérer votre nom , ID et adresses e-mail .</h2>
									<p>Voici les noms et adresses e-mail sur le fichier pour votre compte .</p>
									<br>
									<dl class="dl-horizontal">
										<dt><strong>Votre Nom </strong></dt>
										<dd>
											Edward Rooster
											<span>
												<a class="pull-right" href="#">
													<i class="fa fa-pencil"></i>
												</a>
											</span>
										</dd>
										<hr>
										<dt><strong>Votre ID </strong></dt>
										<dd>
											FKJ-032440
											<span>
												<a class="pull-right" href="#">
													<i class="fa fa-pencil"></i>
												</a>
											</span>
										</dd>
										<hr>
										<dt><strong>Votre Adresse E-Mail </strong></dt>
										<dd>
											edward-rooster@gmail.com
											<span>
												<a class="pull-right" href="#">
													<i class="fa fa-pencil"></i>
												</a>
											</span>
										</dd>
										<hr>
										<dt><strong>Numéro de téléphone </strong></dt>
										<dd>
											(304) 33-2867-499
											<span>
												<a class="pull-right" href="#">
													<i class="fa fa-pencil"></i>
												</a>
											</span>
										</dd>
										<hr>
										<dt><strong>Adresse domicile </strong></dt>
										<dd>
											California, US
											<span>
												<a class="pull-right" href="#">
													<i class="fa fa-pencil"></i>
												</a>
											</span>
										</dd>
										<hr>
									</dl>
									<button type="button" class="btn-u btn-u-default">Annuler</button>
									<button type="button" class="btn-u">Enregistrer les Modifications</button>
								</div>

								<div id="passwordTab" class="profile-edit tab-pane fade">
									<h2 class="heading-md">Gérer vos paramètres de sécurité .</h2>
									<p>Changer votre Mot de Passe</p>
									<br>
									<form class="sky-form" id="sky-form4" action="#">
										<dl class="dl-horizontal">
											<dt>Identifiant</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-user"></i>
														<input type="text" placeholder="Username" name="username">
														<b class="tooltip tooltip-bottom-right">Nécessaire pour accéder au site</b>
													</label>
												</section>
											</dd>
											<dt>Adresse E-Mail</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-envelope"></i>
														<input type="email" placeholder="Email address" name="email">
														<b class="tooltip tooltip-bottom-right">Nécessaire pour vérifier votre compte</b>
													</label>
												</section>
											</dd>
											<dt>Nouveau Mot de passe</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-lock"></i>
														<input type="password" id="password" name="password" placeholder="Password">
														<b class="tooltip tooltip-bottom-right">Ne pas oublier votre mot de passe</b>
													</label>
												</section>
											</dd>
											<dt>Confirmation</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-lock"></i>
														<input type="password" name="passwordConfirm" placeholder="Confirm password">
														<b class="tooltip tooltip-bottom-right">Ne pas oublier votre mot de passe</b>
													</label>
												</section>
											</dd>
										</dl>
										<label class="toggle toggle-change"><input type="checkbox" checked="" name="checkbox-toggle-1"><i class="no-rounded"></i>S'en souvenir</label>
										<br>
										<section>
											<label class="checkbox"><input type="checkbox" id="terms" name="terms"><i></i><a href="#">J'accepte les termes et conditions</a></label>
										</section>
										<button type="button" class="btn-u btn-u-default">Annuler</button>
										<button class="btn-u" type="submit">Enregistrer les modifications</button>
									</form>
								</div>
								</div>
							</div>
						</div>
						<!--End Seeting-->

						</div><!--/end row-->
					</div>
				</div>
				<!-- End Profile Content -->
			</div>
		</div>
		<!--=== End Profile ===-->

		</div>
		<!--=== End Footer Version 1 ===-->
	</div><!--/wrapper-->

	<!--=== End Style Switcher ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/circles-master/circles.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/datepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/circles-master.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/style-switcher.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			Datepicker.initDatepicker();
			CirclesMaster.initCirclesMaster1();
			StyleSwitcher.initStyleSwitcher();
		});
	</script>

                        </div>
                    </div>
                </div>
            </div>
        </div>
            </jsp:body>
        </t:template_owner>