<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dw_website._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link href="CSS/body-proC.css" rel="stylesheet" type="text/css" />
	<script src="Scripts/jquery.min.js" type="text/javascript"></script>
	<script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
	<script src="Scripts/jquery.placeholder.js" type="text/javascript"></script>
	<script src="Scripts/acordeon.js" type="text/javascript"></script>
	<script type='text/javascript' src='/Scripts/jquery.placeholder.js'></script>
	<script type="text/javascript">

	    $(document).ready(function () {

	        var is_mobile = window.matchMedia("only screen and (max-width: 760px)");

	        if (is_mobile.matches) {
	            $('div#navcontainer').prepend('<div id="menu-trigger">Menu</div>');
	            $("#menu-trigger").on("click", function () { $("#div#navcontainer li div").slideToggle(); });
			} else {
				$('div#navcontainer li').has('ul').mouseover(
				    function () {
				        $(this).children('div').css('display', 'inline-block');
				    }).mouseout(function () {
				        $(this).children('div').css('display', 'none');
				    }
			    );
	        }
            
	        $("#OpenDialog").click(function () {
	            $("#updateControls").dialog();
	        });
	        $("#btnUpdate").click(function () {
	            alert($("#txtUpdate1").val());
	        });
	    });


		function clear() {
			$("#txtUpdate1").val("");
			$("#txtUpdate1").val("");
			$("#txtUpdate1").val("");
		}
		/*
		function bindData() {

			$.ajax({
				type: "POST",
				url: "Default.aspx/getData",
				data: "{}",
				contentType: "application/json; charset=utf-8",
				datatype: "jsondata",
				async: "true",
				success: function (response) {

					if ($('#tblResult').length != 0) // remove table if it exists
					{ $("#tblResult").remove(); }

					var table = "<table class='tblResult' id=tblResult><thead> <tr><th>Name</th><th>Email</th><th>Age</th></thead>  <tbody>";
					for (var i = 0; i <= response.d.length - 1; i++) {
						var row = "<tr>";

						row += '<td>' + response.d[i].Name + '</td>';
						row += '<td>' + response.d[i].Email + '</td>';
						row += '<td>' + response.d[i].Age + '</td>';
						row += '</tr>';
						table += row;
					}
					table += '</tbody></table>';
					$('#divData').html(table);
					$("#divData").slideDown("slow");
				},
				error: function (response) {
					alert(response.status + ' chandan ' + response.statusText);
				}
			});
		}
		*/
		function saveData() {
			var txtName = $("#txtUpdate1").val();
			var txtName2 = $("#txtUpdate1").val();
			var txtName3 = $("#txtUpdate1").val();
			$.ajax({
				type: "POST",
				url: "Default.aspx/saveData",
				data: "{val1:'" + txtName + "',val2:'" + txtName2 + "',val3:'" + txtName3 + "'}",
				contentType: "application/json; charset=utf-8",
				datatype: "jsondata",
				async: "true",
				success: function (response) {
					$(".errMsg ul").remove();
					var myObject = eval('(' + response.d + ')');
					if (myObject > 0) {
						//bindData();
						$(".errMsg").append("<ul><li>Data saved successfully</li></ul>");
					}
					else {
						$(".errMsg").append("<ul><li>Opppps something went wrong.</li></ul>");
					}
					$(".errMsg").show("slow");
					clear();
				},
				error: function (response) {
					alert(response.status + ' ' + response.statusText);
				}
			});
		}

		/**SUBMENU NAV**/

		$(function () {

			$('#baseUrl').click(function () {
				window.location = $(this).attr('href') + '?Project=' + $('#appendUrl').val();
				return false;
			});

			$('#baseUrl2').click(function () {
				window.location = $(this).attr('href') + '?Project=' + $('#appendUrl2').val();
				return false;
			});

			$('#baseUrl3').click(function () {
				window.location = $(this).attr('href') + '?ProjectTask=' + $('#appendUrl3').val();
				return false;
			});

			$(document).click(function (e) {
				if (e.target.id.indexOf('appendUrl') == -1 &&
				e.target.id.indexOf('baseUrl') == -1 &&
				e.target.id != 'liSubMenuMasterProject' &&
				e.target.id != 'liSubMenuProjects' &&
				e.target.id != 'liSubMenuTask' &&
				e.target.className != 'placeholderHelper' &&
				e.target.className != 'input-wrapper' &&
				e.target.className != 'input-wrapper filled'
				) {
					$("#subMenuTechnicalCenters").hide();
					$("#subMenuDivisions").hide();
					$("#subMenuMasterProject").hide();
					$("#subMenuProjects").hide();
					$("#subMenuTask").hide();
					$("#subMenuSponsors").hide();
					$("#subMenuPortfolios").hide();
				}
			});

			$('#TechnicalCenters').click(function (e) {
				$("#subMenuTechnicalCenters").show();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").hide();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").hide();
				e.stopPropagation();
				return false;
			});

			$('#Divisions').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").show();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").hide();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").hide();
				e.stopPropagation();
				return false;
			});

			$('#MasterProject').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").show();
				$("#subMenuProjects").hide();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").hide();
				$("#appendUrl").focus();
				//$("#appendUrl").attr("placeholder", "");
				e.stopPropagation();
				return false;
			});

			$('#Projects').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").show();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").hide();
				$("#appendUrl2").focus();
				//$("#appendUrl2").attr("placeholder", "");
				e.stopPropagation();
				return false;
			});

			$('#Task').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").hide();
				$("#subMenuTask").show();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").hide();
				$("#appendUrl3").focus();
				//$("#appendUrl3").attr("placeholder", "");
				e.stopPropagation();
				return false;
			});

			$('#Sponsors').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").hide();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").show();
				$("#subMenuPortfolios").hide();
				e.stopPropagation();
				return false;
			});

			$('#Portfolios').click(function (e) {
				$("#subMenuTechnicalCenters").hide();
				$("#subMenuDivisions").hide();
				$("#subMenuMasterProject").hide();
				$("#subMenuProjects").hide();
				$("#subMenuTask").hide();
				$("#subMenuSponsors").hide();
				$("#subMenuPortfolios").show();
				e.stopPropagation();
				return false;
			});

			$("#appendUrl").keyup(function (e) {
				var key = e.which;
				if (key == 13) {
					$("#baseUrl").click();
					return false;
				}
			});

			$("#appendUrl2").keyup(function (e) {
				var key = e.which;
				if (key == 13) {
					$("#baseUrl2").click();
					return false;
				}
			});

			$("#appendUrl3").keyup(function (e) {
				var key = e.which;
				if (key == 13) {
					$("#baseUrl3").click();
					return false;
				}
			});

		});

		//$(function() {
		//	$('input, textarea').placeholder();
		//});

		/*
		* Persistent Placeholder - treats a label like a placeholder and
		* makes it persist even when you focus on an input. Huzzah!
		*/
		(function ($) {

			var parentSelector = '.input-wrapper',
			inputSelectors = [parentSelector + '>input.text', parentSelector + '>textarea'],
			len = inputSelectors.length,
			i;

			function update(force) {
				var $input = $(this),
				$parent = $input.parent(parentSelector);
				return $parent[force === true || $input.val() ? 'addClass' : 'removeClass']('filled');
			}

			function focus() {
				update.call(this).addClass('focus');
			}

			function blur() {
				update.call(this).removeClass('focus');
			}

			function keydown(evt) {
				var c = evt.keyCode;
				((47 < c && c < 91) || (95 < c && c < 112) || (185 < c && c < 223)) && update.call(this, true);
			}

			$.fn.prepareInput = function () {
				return this.each(update);
			};

			for (i = 0; i < len; i++) {
				$(inputSelectors[i]).live('focus', focus).live('blur', blur).live('keyup', update).live('click', update).live('keydown', keydown);
			}

			$(function () {
				for (i = 0; i < len; i++) {
					$(inputSelectors[i]).prepareInput();
				}
			});

		})(jQuery);


        $(document).ready(function () {

            var allPanels = $('.accordion > dd').hide();
            $('.accordion > dt:first').next().addClass('active').slideDown();

            $('.accordion > dt > a').click(function () {
                $this = $(this);
                $target = $this.parent().next();

                if (!$target.hasClass('active')) {
                    allPanels.removeClass('active').slideUp();
                    $target.addClass('active').slideDown();
                } else {
                    $target.removeClass('active').slideUp();
                }

                return false;
            });


            $("#Customer").click(function () {
                $("#report1").show();
                $("#report2").hide();
            });

            $("#DirectCost").click(function () {
                $("#report1").hide();
                $("#report2").show();
            });


        });

        


  </script>
  <style>
	/*
	.placeholderHelper{
		position: absolute;
		right: 15px; /* Chrome + Safari? */ /*
		right: 22px\9; /* IE9 hack */ /*
		color: #ccc;
		font-size:10px;
		visibility:hidden;
	}
	
	@media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
		/* IE10+ CSS styles go here *//*
		.placeholderHelper{
			position: absolute;
			right: 22px; 
			color: #ccc;
			font-size:10px;
			visibility:hidden;
		}
	
	}
	
	@-moz-document url-prefix() { 
		/* Firefox CSS styles go here *//*
		.placeholderHelper{
			position: absolute;
			top:2px;
			right: 28px; 
			color: #ccc;
			font-size:10px;
			visibility:hidden;
		}
	
	}
	
	input:focus + .placeholderHelper { visibility:visible; }
	*/
	
	
	/** input wrapper */

	.input-wrapper {
		position: relative;
		display: -moz-inline-box;
		display: inline-block;
		*display: inline; /* ie6&7 */
		zoom: 1;
		margin: 3px 0;
		border: 1px solid #bbb;
		background: #fff;
		line-height: 16px;
		height: 20px;
		vertical-align: middle;
	}
	
	.input-wrapper input.text,
	.input-wrapper textarea {
		z-index: 2;
		margin: 0;
		border: 0;
		background: transparent;
		/*
		*background: url(http://hunch.com/media/img/t.png);  ie7 does weird stuff with transparent background, also please don't deep link to this image from your code 
		*/
	}
	
	.input-wrapper label {
		z-index: 1;
		position: absolute;
		height: 16px;
		padding-top:3px;
		padding-left:3px;
		font-size: 10px;
		line-height: 16px;
		color: #999;
		overflow: hidden;
	}
	
	.input-wrapper.focus label{
		filter:alpha(opacity=50);
		opacity: 0.4;
	}
	
	.input-wrapper.filled label{
		display: none;
	}
	
	/* **/
	
	
	</style>
</head>
<body>
	<form id="form1" runat="server">
	    <div id="contentWrapper">
            <div id="header">
			    <div id="divLogo"><img src="Images/logo.png" /></div>
                <div id="divUsername"><asp:Label ID="lblUsername" runat="server" Text=""></asp:Label></div>
			    <div id="navcontainer">
				    <div class="s4-lp s4-toplinks">	
					    <div class="menu horizontal menu-horizontal">
						    <ul class="root static">
							    <li class="static"><a class="static menu-item" title="VolpeNet Home Page" href="http://spmaindev.volpe.dot.gov/">HOME</a></li>
							    <li class="static"><a class="static menu-item" title="New &amp; Events" href="http://spmaindev.volpe.dot.gov/SitePages/NewsAndEvents.aspx">NEWS &amp; EVENTS</a></li>
							    <li class="static"><a class="static menu-item" title="Employee Services" href="http://spmaindev.volpe.dot.gov/SitePages/EmployeeServices.aspx">EMPLOYEE SERVICES</a></li>
							    <li class="static"><a class="static menu-item" title="Work Tools" href="http://spmaindev.volpe.dot.gov/SitePages/WorkTools.aspx">WORK TOOLS</a></li>
							    <li class="static dynamic-children"><span class="static dynamic-children menu-item" title="Offices &amp; Divisions">OFFICES &amp; DIVISIONS</span>
							        <div id="dynamicSubMenu">
                                        <ul class="dynamic">
									        <li class="dynamic"><a class="dynamic menu-item" title="Administration (V-100)" href="http://spsites.volpe.dot.gov/RVA-1/Pages/RVA-1AdministrationHome.aspx">Administration (V-100)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Communication and Knowledge Management (V-120)" href="http://spmaindev.volpe.dot.gov/sites/Tools/Communications/Pages/home.aspx">Communication and Knowledge Management (V-120)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Financial Management (V-130)" href="http://spsites.volpe.dot.gov/RVA-1/RVA-30/Pages/default.aspx">Financial Management (V-130)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Legal Services (V-140)" href="http://spsites.volpe.dot.gov/RVA-1/chiefcounsel/Pages/legalhome.aspx">Legal Services (V-140)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Equal Employment Opportunity (V-150)" href="http://spsites.volpe.dot.gov/RVA-1/rva50/default.aspx">Equal Employment Opportunity (V-150)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Operations (V-200)" href="http://spsites.volpe.dot.gov/RVP-1/Pages/RVP-1Operations.aspx">Operations (V-200)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Human Resources (V-210)" href="http://spmaindev.volpe.dot.gov/sites/Tools/HumanResources/Pages/Main.aspx?top">Human Resources (V-210)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Acquisitions (V-220)" href="http://spmaindev.volpe.dot.gov/sites/Tools/Acquisitions/Pages/default.aspx">Acquisitions (V-220)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Information Technology (V-230)" href="http://spsites.volpe.dot.gov/RVP-1/rvp40/Pages/HomePageA.aspx">Information Technology (V-230)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Facilities Management (V-240)" href="http://spsites.volpe.dot.gov/RVP-1/rvp50/Pages/home.aspx">Facilities Management (V-240)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Organizational Culture and Work Life (V-250)" href="http://spmaindev.volpe.dot.gov/sites/Tools/OrganizationalCulture">Organizational Culture and Work Life (V-250)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Management Systems (V-250)" href="http://spsites.volpe.dot.gov/RVP-1/rvp60/Pages/home.aspx">Management Systems (V-250)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Research and Technology (V-300)" href="http://spsites.volpe.dot.gov/RVT-1/Pages/default.aspx">Research and Technology (V-300)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Human Factors (V-310)" href="http://spsites.volpe.dot.gov/RVT-1/rvt80/Pages/HumanFactorsHome.aspx">Human Factors (V-310)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Safety Management &amp; Human Factors (V-310)" href="http://spsites.volpe.dot.gov/RVT-1/sms/Pages/SafetyManagementSystemsHome.aspx">Safety Management &amp; Human Factors (V-310)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Policy, Planning, and Environment (V-320)" href="http://spsites.volpe.dot.gov/RVT-1/rvt20/Pages/MultimodalSystemsHome.aspx">Policy, Planning, and Environment (V-320)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Infrastructure Systems and Technology (V-330)" href="http://spsites.volpe.dot.gov/RVT-1/rvt60/Pages/default.aspx">Infrastructure Systems and Technology (V-330)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Environmental and Energy Systems (V-340)" href="http://spsites.volpe.dot.gov/RVT-1/rvt40/Pages/EnvironmentalandEnergySystemsHome.aspx">Environmental and Energy Systems (V-340)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Air Traffic Systems and Operations (V-340)" href="http://spsites.volpe.dot.gov/RVT-1/rvt70/Pages/CNSHomePage.aspx">Air Traffic Systems and Operations (V-340)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Strategic Initiatives for Research (V-350)" href="http://spsites.volpe.dot.gov/RVT-1/rvt11/Pages/default.aspx">Strategic Initiatives for Research (V-350)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Technology and Data Strategy (V-360)" href="http://spsites.volpe.dot.gov/RVT-1/rvt90/Pages/default.aspx">Technology and Data Strategy (V-360)</a></li>
									        <li class="dynamic"><a class="dynamic menu-item" title="Multimodal Programs and Partnerships (V-370)" href="http://spsites.volpe.dot.gov/RVT-1/rvt50/Pages/FreightLogisticsHome.aspx">*Multimodal Programs and Partnerships (V-370)</a></li>
								        </ul>
                                    </div>
							    </li>
						    </ul>
					    </div>      
				    </div>
			    </div>
                <div class="clearfix"></div>
			    <div id="divBanner"><img src="Images/Banner.png" /></div>
		    </div>
		    <div id="mainContent">
			    <div id="submenu">
				    <div id="subnavcontainer" class="kbNavcontainer">
					    <ul id="navlist" class="knNavlist">
						    <li>
							    <a id="VolpeCenter" href="/sites/DW/Pages/Volpe-Center-AllInOne.aspx" style="width: 80px;">Volpe Center</a>
						    </li>
						    <li>
							    <a id="TechnicalCenters" style="width: 105px;">Technical Centers</a>
							    <ul id="subMenuTechnicalCenters" class="subMenu" style="width: 340px;">
								    <li><a href="/sites/DW/Pages/Tech-Center-All.aspx?TechCenter=V-310">V-310 - Office of Safety Management and Human Factors</a></li>
								    <li><a href="/sites/DW/Pages/Tech-Center-All.aspx?TechCenter=V-320">V-320 - Office of Policy, Planning and Environment</a></li>
								    <li><a href="/sites/DW/Pages/Tech-Center-All.aspx?TechCenter=V-330">V-330 - Office of Infrastructure Systems and Technology</a></li>
								    <li><a href="/sites/DW/Pages/Tech-Center-All.aspx?TechCenter=V-340">V-340 - Office of Air Traffic Systems and Operations</a></li>

							    </ul>
						    </li>
						    <li>
							    <a id="Divisions">Divisions</a>
							    <ul id="subMenuDivisions" class="subMenu" style="width: 300px;">
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-311">V-311 - Safety Information Systems</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-312">V-312 - Aviation Safety Management Systems</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-313">V-313 - Safety Measurement and Analysis</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-314">V-314 - Surface Transportation Human Factors</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-315">V-315 - Aviation Human Factors</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-320A">V-320A - CAFE Program Office</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-321">V-321 - Economic Analysis</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-322">V-322 - Organization Performance</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-323">V-323 - Transportation Planning</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-324">V-324 - Environmental Measurement and Modeling</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-325">V-325 - Energy Analysis and Sustainability</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-326">V-326 - Environmental Science and Engineering</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-331">V-331 - Security and Emergency Management</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-332">V-332 - Situational Awareness and Logistics</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-333">V-333 - Structures and Dynamics</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-334">V-334 - Systems Safety and Engineering</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-335">V-335 - Infrastructure Engineering and Deployment</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-336">V-336 - Technology Innovation and Policy</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-337">V-337 - Advanced Vehicle Technology</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-340A">V-340A - NextGen Program Office</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-341">V-341 - Air Navigation and Surveillance</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-342">V-342 - Aviation Systems Engineering</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-343">V-343 - Air Traffic Management Systems</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-344">V-344 - Aviation Facilities and Business Services</a></li>
								    <li><a href="/sites/DW/Pages/Division-All.aspx?Division=V-345">V-345 - Aircraft Wakes and Weather</a></li>
							    </ul>
						    </li>
						    <li>
							    <a id="MasterProject" style="width: 85px;">Master Project</a>
							    <ul id="subMenuMasterProject" class="subMenuSearch" style="width: 250px;">
								    <li id="liSubMenuMasterProject" style="height:80px;">
									    <label for="appendUrl" class="searchLabel" id="appendUrlSearchLabel">Search:</label>&nbsp;&nbsp;
									     <div class="input-wrapper">
										    <label for="appendUrl" id="appendUrlLabel">Enter master project #</label>
										    <input id="appendUrl" name="appendUrl" type="text" class="text" min="8" maxlength="8" />
										    <br />
										    <br />
										    <a href="/sites/DW/Pages/ProjectMaster-All.aspx" id="baseUrl" class="button">GO</a>
									    </div>
								    </li>
							    </ul>
						    </li>
						    <li>
							    <a id="Projects">Projects</a>
							    <ul id="subMenuProjects" class="subMenuSearch" style="width: 250px;">
								    <li id="liSubMenuProjects" style="height:80px;">
									    <label for="appendUrl2" class="searchLabel" id="appendUrlSearchLabel2">Search: </label>&nbsp;&nbsp;
									    <div class="input-wrapper">
										    <label for="appendUrl2" id="appendUrlLabel2">Enter project #</label>
										    <input id="appendUrl2" name="appendUrl2" type="text" class="text" min="8" maxlength="8" />
										    <br />
										    <br />
										    <a href="/sites/DW/Pages/Project-All.aspx" id="baseUrl2" class="button">GO</a>
									    </div>
								    </li>
							    </ul>
						    </li>
						    <li>
							    <a id="Task">Task</a>
							    <ul id="subMenuTask" class="subMenuSearch" style="width: 250px;">
								    <li id="liSubMenuTask" style="height:80px;">
									    <label for="appendUrl3" class="searchLabel" id="appendUrl3Label">Search: </label>&nbsp;&nbsp;
									    <div class="input-wrapper">
										    <label for="appendUrl3" id="appendUrlLabel3">Enter task #</label>
										    <input id="appendUrl3" name="appendUrl3" type="text" class="text" min="15" maxlength="15" />
										    <br />
										    <br />
										    <a href="/sites/DW/Pages/Task-All.aspx" id="baseUrl3" class="button">GO</a>
									    </div>
								    </li>
							    </ul>
						    </li>
						    <li>
							    <a id="Sponsors">Sponsors</a>
							    <ul id="subMenuSponsors" class="subMenu" style="width: 90px;">
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=AIR FORCE">Air Force</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=ARMY">Army</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=DOD OTHER">DOD Other</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=INTERSERVICE">Interservice</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=NAVY">Navy</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=DOT OTHER">DOT Other</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FAA">FAA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FHWA">FHWA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FMCSA">FMCSA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FRA">FRA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FTA">FTA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=MARAD">MARAD</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=NHTSA">NHTSA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=OST">OST</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=PHMSA">PHMSA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=RITA">RITA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=SLSDC">SLSDC</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=CAPITOL POLICE">Capitol Police</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=ENERGY">Energy</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=EPA">EPA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=FOREIGN">Foreign</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=HOMELAND">Homeland</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=INTERIOR / FLMA">Interior / FLMA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=NASA">NASA</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=NON FEDERAL">Non Federal</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=OTHER OTHER">Other Other</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=STATE / LOCAL">State / Local</a></li>
								    <li><a href="/sites/DW/Pages/Sponsor-All.aspx?Sponsor=USPS">USPS</a></li>
							    </ul>
						    </li>
						    <li>
							    <a id="Portfolios" style="width: 67px;">Portfolios</a>
							    <ul id="subMenuPortfolios" class="subMenu" style="width: 99px;">
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=DHS">DHS</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=DOD">DOD</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=EPA">EPA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FAA AEE">FAA AEE</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FAA ATO">FAA ATO</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FAA AVS">FAA AVS</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FAA Other">FAA Other</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FHWA">FHWA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FMCSA">FMCSA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FRA">FRA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=FTA">FTA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=ITS">ITS</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=JPO">JPO</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=MARAD">MARAD</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=NASA">NASA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=NHTSA">NHTSA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=OPS SUPPORT">OPS Support</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=OST">OST</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=OST-R">OST-R</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=OTHER FEDERAL">Other Federal</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=PHMSA">PHMSA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=PRIVATE SECTOR">Private Sector</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=Public Lands">Public Lands</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=RITA">RITA</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=SBIR">SBIR</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=SLSDC">SLSDC</a></li>
								    <li><a href="/sites/DW/Pages/Portfolio-All.aspx?Portfolio=State / Local">State / Local</a></li>
							    </ul>
						    </li>
					    </ul>
				    </div>
			    </div>
                <div class="filterBar">
	                <h2 class="volpe">Standard Reports </h2>

	                <p>
		                Please select a green button below to display another list filtered by a specific category.
	                </p>

	                <div class="filter">
		                <p>
			                Filter:
		                </p>

		                <ul class="filterList">
			                <li id="Customer"><a class="filterLink">Customer</a></li>
			                <li id="DirectCost"><a class="filterLink">Direct Cost Summary</a></li>
			                <li id="Division"><a class="filterLink">Division</a></li>
			                <li id="Master"><a class="filterLink">Master Project</a></li>
			                <li id="Task"><a class="filterLink">Task</a></li>
			                <li id="Technical"><a class="filterLink">Technical Center</a></li>
			                <li id="allNav"><a class="filterLink active">All</a></li>
		                </ul>
	                </div>
	                <div id="noPermissionsAtAll"></div>
                </div>
                <div id="report1" style="display:none;">Report 1</div>
                <div id="report2" style="display:none;">Report 2</div>
			    <br />
                <table id="innerContent">
                    <tr>
                        <td id="leftInner"></td>
                        <td id="mainInner">
                            <dl class="accordion">
                                <dt><a><h3 class="FAQh3Link">Q: The Parameters area blocks some of the report</h3></a></dt>
                                <dd class="introHide active" style="display: block;">
                                    <strong>A:</strong>The new SQL Server Reporting Services (SSRS) displays all the prompt fields on the right side of the screen in an area named <i>Parameters</i>.Depending upon the type of report being generated, some of the prompts are pre-filled; the Fiscal Year will have the current fiscal year and the Ending Date (which may be titled Through Date or Month Ending Date) may have the last full month or pay period.
                                    <br />
                                    After entering all the prompts, click the <b>Apply</b> button at the bottom of the Prompt area to generate the report.
                                    <br />
                                    <br />
                                </dd>
                                <dt><a><h3 class="FAQh3Link">Q: How do I use the icons on the SSRS toolbar?</h3></a></dt>
                                <dd class="introHide" style="display: none;"><strong>A:</strong>
                                    <p>​</p>
                                    The icons on the SRS toolbar are shortcuts to aid you in delving into the report.When you click on the down arrow for Actions, a drop-down list appears with 4 options.
                                    They are:
                                    <blockquote dir="ltr" style="margin-right:0px">
                                        1.Open with Report Builder: This option is not supported at this time.
                                        2.Subscribe: This option is not supported at this time.
                                        3. Print: This option allows you to print the report. Please see FAQ on printing for details.
                                        4. Export: This option allows you to export the data and has several option choices. Please see FAQ on exporting for details.
                                    </blockquote>
                                    <b>Refresh:</b> When you click on this icon, the report is regenerated and displayed as if you had just selected the report from the Report list. This is useful if you have drilled down several levels (i.e., from Project Master to IAA to Task to Monthly Cost data) and want to return to the top level on all sections.
                                </dd>
                                <dt><a><h3 class="FAQh3Link">Q: How do I get to another section of the report?</h3></a></dt>
                                <dd class="introHide" style="display: none;">
                                    <strong>A:</strong>
                                    <p>​</p>
                                    A report with 5 sections listed in the <i>Heading</i> area will have 5 corresponding pages. If you enter 3 for the page number the Cost Breakdown section will be displayed. You may also use the left and right arrows to go to the next/previous page or the first/last page of the report.
                                </dd>
                            </dl>
                        </td>
                        <td id="rightInner">
                            <div class="sideContact side sideStatus">
                                <h4>System Status</h4>
                                <div class="sideInner">
                                    <p><strong>Current Status: <span class="available">Available</span></strong></p>
                                    <p><strong>Current FY:</strong>2015</p>
                                    <p><strong>Last Labor Period End Date:</strong>2/21/2015</p>
                                    <p><strong>Last DW Refresh:</strong>3/11/2015</p>
                                </div>
                            </div>
                            <div class="sideContact side">
	                            <h4>Support Documents</h4> 
	                            <div class="sideInner">
		                            <ul class="listNoMarg NoMargLeftSide ">
			                            <li><a href="/sites/DW/Pages/Taxonomy.aspx">Glossary</a></li>
                                        <li><a href="/sites/DW/Pages/faq.aspx">FAQ</a></li>
                                        <li><a href="/sites/DW/Pages/FDM-2-0-Introduction1.aspx">FDM 2-0 Introduction</a></li>
			                            <li><a href="/sites/DW/Pages/SupportDoc.aspx">Support Documents</a></li>
                                    </ul>
	                            </div>
                            </div>
                            <div class="sideContact side">
	                            <h4>Contact Information</h4> 
	                            <div class="sideInner">
			                        <strong>Contact for this site: </strong>: 
			                        <br />
			                        <a href="mailto:DW_Support-1@dot.gov" class="emailPad">DW_Support-1@dot.gov</a> 
                                    <br />
                                    <br />
		                            <strong>IT Help Desk</strong>:<br />
                                    <label class="emailPad">(617) 494-2381</label><br />
			                        <a href="mailto:ITHelpDesk@dot.gov" class="emailPad">ITHelpDesk@dot.gov</a> 
	                            </div>
                            </div>
                        </td>
                    </tr>
                </table>
			    <br />
                <br />
                <div id="updateLinks"><a id="OpenDialog">Open Dialog</a></div>
			    <div id="updateControls" title="Update Dialog" style="display:none;">
				    <div id="divData">
				    </div>
				    Text to Update: 
				    <asp:TextBox ID="txtUpdate1" runat="server"></asp:TextBox>
				    <br />
				    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
				    <input type="button" onclick="saveData()" id="btnSave" value="Save" title="Save" />
				    <br />
				    <div class="errMsg">
				    </div>
			    </div>
			    <div id="reports"></div>
                <br />
                <br />
                <br />
		    </div>
            <div id="footerSpacer" style="padding-top:20px;"></div>
            <div id="footer">
                <div id="innerFooter">
		            <div class="footlinks">
                    
			            <h3>ON VOLPENET</h3>
			            <ul>
				            <li><a href="http://tinyurl.com/VolpeStaffDirectory">Employee Directory &gt;</a></li>
				            <li><a href="mailto:volpecommunicationsteam@dot.gov">Report an Issue/Error &gt;</a></li>
			            </ul>
		            
                    </div>
		            <div class="footlinks">
			            <h3>ON VOLPE.DOT.GOV</h3>
			            <ul>
				            <li><a href="http://www.volpe.dot.gov/">Home &gt;</a></li>
				            <li><a href="http://www.volpe.dot.gov/about-us/careers">Careers &gt;</a></li>
				            <li><a href="http://www.volpe.dot.gov/about-us">Overview &gt;</a></li>
				            <li><a href="http://www.volpe.dot.gov/about-us/contact-us">Contact Us &gt;</a></li>	
				            <li><a href="http://www.volpe.dot.gov/work-with-us/procurement-opportunities">Procurement Opportunities &gt;</a></li>
				            <li><a href="http://www.volpe.dot.gov/library/index.html">Volpe Center Library &gt;</a></li>
			            </ul>
		            
                    </div>
		            <div class="footlinks">
			            <h3>OST-R</h3>
			            <ul>
				            <li><a href="http://www.rita.dot.gov/about_rita/">About OST-R &gt;</a></li>
				            <li><a href="http://www.rita.dot.gov/press_room">Press Room &gt;</a></li>
				            <li><a href="http://www.rita.dot.gov/offices/">Offices &gt;</a></li>
				            <li><a href="http://www.rita.dot.gov/contacts/">Contact OST-R &gt;</a></li>
			            </ul>
		            
                    </div>
		            <div class="footlinks">
			            <h3>OTHER</h3>
			            <ul>
				            <li><a href="http://www.dot.gov/">Department of Transportation &gt;</a></li>
				            <li><a href="http://dotnet.dot.gov/Default.aspx">DOT.net &gt;</a></li>
				            <li><a href="http://www.osc.gov/">Whistleblower Protection &gt;</a>	</li>
				            <li><a href="http://www.usa.gov/">*USA.gov &gt;</a></li>
			            </ul>
		            
                    </div>
	            </div>
            </div>
		    
	    </div>

	</form>
</body>
</html>
