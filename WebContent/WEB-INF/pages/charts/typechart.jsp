<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML">
<html>
<head>
<meta http-equiv="Content-Language" content="hi">
<jsp:directive.include file="../navigation/libs.jsp" />
<jsp:directive.include file="../navigation/nav.jsp" />
<%-- <spring:url value="/resources/bootstrap.css" var="bootstrapCSS" />
	<spring:url value="/resources/jquery.min.js" var="jqueryJS" />
	
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<script src="${jqueryJS}"></script> --%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="style.css" type="text/css">
<script src="../amcharts/amcharts.js" type="text/javascript"></script>
<script src="../amcharts/serial.js" type="text/javascript"></script>

<script type="text/javascript">
	var chart;

	var chartData = [ {
		"country" : "Technical",
		"visits" : '${count[0]}',
		"color" : "#0099FF"
	}, {
		"country" : "HR",
		"visits" : '${count[1]}',
		"color" : "#FF6600"
	}, {
		"country" : "Administration",
		"visits" : '${count[2]}',
		"color" : "#73AD21"
	} /* ,
	                {
	                    "country": "Germany",
	                    "visits": 1322,
	                    "color": "#FCD202"
	                },
	                {
	                    "country": "UK",
	                    "visits": 1122,
	                    "color": "#F8FF01"
	                },
	                {
	                    "country": "France",
	                    "visits": 1114,
	                    "color": "#B0DE09"
	                },
	                {
	                    "country": "India",
	                    "visits": 984,
	                    "color": "#04D215"
	                },
	                {
	                    "country": "Spain",
	                    "visits": 711,
	                    "color": "#0D8ECF"
	                },
	                {
	                    "country": "Netherlands",
	                    "visits": 665,
	                    "color": "#0D52D1"
	                },
	                {
	                    "country": "Russia",
	                    "visits": 580,
	                    "color": "#2A0CD0"
	                },
	                {
	                    "country": "South Korea",
	                    "visits": 443,
	                    "color": "#8A0CCF"
	                },
	                {
	                    "country": "Canada",
	                    "visits": 441,
	                    "color": "#CD0D74"
	                } */
	];

	AmCharts.ready(function() {
		// SERIAL CHART

		chart = new AmCharts.AmSerialChart();
		chart.dataProvider = chartData;
		chart.categoryField = "country";
		chart.startDuration = 1;
		chart.depth3D = 50;
		chart.angle = 30;
		chart.marginRight = -45;

		// AXES
		// category
		var categoryAxis = chart.categoryAxis;
		categoryAxis.gridAlpha = 0;
		categoryAxis.axisAlpha = 0;
		categoryAxis.gridPosition = "start";

		// value
		var valueAxis = new AmCharts.ValueAxis();
		valueAxis.axisAlpha = 0;
		valueAxis.gridAlpha = 0;
		chart.addValueAxis(valueAxis);

		// GRAPH
		var graph = new AmCharts.AmGraph();
		graph.valueField = "visits";
		graph.colorField = "color";
		graph.balloonText = "<b>[[category]]: [[value]]</b>";
		graph.type = "column";
		graph.lineAlpha = 0.5;
		graph.lineColor = "#FFFFFF";
		graph.topRadius = 1;
		graph.fillAlphas = 0.9;
		chart.addGraph(graph);

		// CURSOR
		var chartCursor = new AmCharts.ChartCursor();
		chartCursor.cursorAlpha = 0;
		chartCursor.zoomable = false;
		chartCursor.categoryBalloonEnabled = false;
		chartCursor.valueLineEnabled = true;
		chartCursor.valueLineBalloonEnabled = true;
		chartCursor.valueLineAlpha = 1;
		chart.addChartCursor(chartCursor);

		chart.creditsPosition = "top-right";

		// WRITE
		chart.write("chartdiv");

	});

	$(document)
			.ready(
					function() {
						AmCharts
								.makeChart(
										"chartdiv2",
										{
											"type" : "pie",
											"angle" : 12,
											"balloonText" : "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
											"depth3D" : 15,
											"innerRadius" : "40%",
											"colors" : [ "#0099FF", "#FF6600",
													"#73AD21", "#FCD202",
													"#F8FF01", "#B0DE09",
													"#04D215", "#0D8ECF",
													"#0D52D1", "#2A0CD0",
													"#8A0CCF", "#CD0D74",
													"#754DEB", "#DDDDDD",
													"#999999", "#333333",
													"#000000", "#57032A",
													"#CA9726", "#990000",
													"#4B0C25" ],
											"titleField" : "category",
											"valueField" : "column-1",
											"allLabels" : [],
											"balloon" : {},
											"legend" : {
												"enabled" : true,
												"align" : "center",
												"markerType" : "circle"
											},
											"titles" : [],
											"dataProvider" : [ {
												"category" : "Technical",
												"column-1" : '${count[0]}'
											}, {
												"category" : "HR",
												"column-1" : '${count[1]}'
											}, {
												"category" : "Administration",
												"column-1" : '${count[2]}'
											} ]
										});
					});
</script>
</head>
<style>
.slice1 .amcharts-pie-slice {
	color: "#0099FF";
}
</style>
<body>
	<div class="container">
		<br />
		<div class="row">
			<jsp:directive.include file="../navigation/subHeader.jsp" />
		</div>
		<br>
		<div class="row">
			<div class="alert alert-info" align="center" role="alert">
				<h4>Count of Questions in each category</h4>
			</div>
			<div class="col-md-6">

				<div id="chartdiv" style="width: 350px; height: 300px;"></div>
			</div>
			<div class="col-md-6">
				<div id="chartdiv2" style="width: 600px; height: 400px;"></div>
			</div>
		</div>
	</div>

</body>

</html>