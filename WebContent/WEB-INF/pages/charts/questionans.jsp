<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	 <jsp:directive.include file="../navigation/libs.jsp" /> 
	<jsp:directive.include file="../navigation/nav.jsp" />
<title>Vartalap</title>
</head>
<script type="text/javascript">


</script>
<body>
<%-- Total Technical questions : -${count[0][0]}
Ansewerd - ${count[0][1]}
<br>
Total HR questions : -${count[1][0]}
Ansewerd - ${count[1][1]}
<br>
Total Admin questions : -${count[2][0]}
Ansewerd - ${count[2][1]} --%>
 <div class="container">
<br/>
		<div class="row">
       <jsp:directive.include file="../navigation/subHeader.jsp" />
       </div>
      <br>
         <div class="row">
         <div class="alert alert-info" align="center"role="alert"><h4>Questions Answered and Unanswered</h4></div>
  			<!-- <div class="col-md-6">
  				
  				<div id="chartdiv" style="width: 350px; height: 300px;"></div>
  			</div>
  			<div class="col-md-6">
				 <div id="chartdiv2" style="width:600px; height:400px;"></div>
			</div> -->
			 <div id="chartdiv" style="width: 600px; height: 400px;"></div>
       		 <div style="margin-left:30px;">
	        <input type="radio" checked="true" name="group" id="rb1" onclick="setDepth()">2D
	        <input type="radio" name="group" id="rb2" onclick="setDepth()">3D
		</div>
		</div>
   </div>
</body>
</html>
<script>

var chart;

var chartData = [
    {
        "year": "Technical",
        "europe": '${count[0][1]}',
        "namerica": '${count[0][0]-count[0][1]}'
    },
    {
        "year": "HR",
        "europe": '${count[1][1]}',
        "namerica": '${count[1][0]-count[1][1]}'
    },
    {
        "year": "Administration",
        "europe": '${count[2][1]}',
        "namerica": '${count[2][0]-count[2][1]}'
    }
];

AmCharts.ready(function () {
    // SERIAL CHART
    chart = new AmCharts.AmSerialChart();
    chart.dataProvider = chartData;
    chart.categoryField = "year";
    chart.plotAreaBorderAlpha = 0.2;

    // AXES
    // category
    var categoryAxis = chart.categoryAxis;
    categoryAxis.gridAlpha = 0.1;
    categoryAxis.axisAlpha = 0;
    categoryAxis.gridPosition = "start";

    // value
    var valueAxis = new AmCharts.ValueAxis();
    valueAxis.stackType = "regular";
    valueAxis.gridAlpha = 0.1;
    valueAxis.axisAlpha = 0;
    chart.addValueAxis(valueAxis);

    // GRAPHS
    // first graph    
    var graph = new AmCharts.AmGraph();
    graph.title = "Answered";
    graph.labelText = "[[value]]";
    graph.valueField = "europe";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#9bc322";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph);

    // second graph              
    graph = new AmCharts.AmGraph();
    graph.title = "Unanswered";
    graph.labelText = "[[value]]";
    graph.valueField = "namerica";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#ff8000";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph);                

   /*  // third graph                              
    graph = new AmCharts.AmGraph();
    graph.title = "Asia-Pacific";
    graph.labelText = "[[value]]";
    graph.valueField = "asia";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#B3DBD4";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph);

    // fourth graph  
    graph = new AmCharts.AmGraph();
    graph.title = "Latin America";
    graph.labelText = "[[value]]";
    graph.valueField = "lamerica";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#69A55C";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph);

    // fifth graph
    graph = new AmCharts.AmGraph();
    graph.title = "Middle-East";
    graph.labelText = "[[value]]";
    graph.valueField = "meast";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#B5B8D3";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph);

    // sixth graph   
    graph = new AmCharts.AmGraph();
    graph.title = "Africa";
    graph.labelText = "[[value]]";
    graph.valueField = "africa";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 1;
    graph.lineColor = "#F4E23B";
    graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span class='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
    chart.addGraph(graph); */

    // LEGEND                  
    var legend = new AmCharts.AmLegend();
    legend.borderAlpha = 0.2;
    legend.horizontalGap = 10;
    chart.addLegend(legend);

    // WRITE
    chart.write("chartdiv");
});

// this method sets chart 2D/3D
function setDepth() {
    if (document.getElementById("rb1").checked) {
        chart.depth3D = 0;
        chart.angle = 0;
    } else {
        chart.depth3D = 25;
        chart.angle = 30;
    }
    chart.validateNow();
}
</script>
