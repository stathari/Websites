 var chartId = "";
 
 $(window).resize(function(){
	if(chartId){
		$('#' + chartId).empty();
		loadTooltipChart(chartId);
	}
 });
 function loadTooltipChart(id, year, genre, studio){
		chartId = id;
		 var chartWidth = $( '#' + id ).width(),
		     chartHeight = $( '#' + id ).height()-120;
		 if ( $(document).width() <= 768 ) {
			chartWidth = 450;
			chartHeight = 400;
		 }
		 if(year){
			var filePath = 'data/bubble-' + year + '.tsv';

		 }else {
			var filePath = 'data/bubble-2014.tsv';
		 }
		 if(!genre){
			genre = "All";
		}
		if(!studio){
			studio = "All";
		}
		 $( '#' + id ).empty();
		 var svg = dimple.newSvg("#" + id, chartWidth, chartHeight);
			d3.tsv(filePath, function (data) {
			  
			  // Focus on the top 6 brands
			 // data = dimple.filterData(data, "Date", ["01/01/2011", "01/02/2011", "01/03/2011", "01/04/2011", "01/05/2011", "01/06/2011"]);
			//	console.log(JSON.stringify(data[0]) + JSON.stringify(data[1]));
			if ( genre != "All" ){
				data = dimple.filterData(data, "Genre", [genre]);
			}
			if ( studio != "All" ){
				data = dimple.filterData(data, "Studio", [studio]);
			}
			if ( data.length == 0 ){
				$( '#' + id ).html('<label>No data available!</label>');
				return;
			}
			  // The main chart
			  var myChart = new dimple.chart(svg, data);
			  // The chart to show in a tooltip
			  var tipChart = null;
			  // The other popup shapes
			  var popup = null;
			  myChart.setBounds(60, 50, chartWidth - 160, chartHeight - 180);
			  // Position the main chart
			 
			  // Add the main chart axes
			  myChart.addCategoryAxis("x", "Released Date");
			  myChart.addMeasureAxis("y", "Sales (Million USD)");
			  myChart.addMeasureAxis("z", "Sales Value");
			   if ( $(document).width() <= 768 ) {
				myChart.setBounds(60, 40, chartWidth - 60, chartHeight);
			  }
			  // Draw bubbles by Movie Name colored by brand
			  var s = myChart.addSeries(["Movie Name"], dimple.plot.bubble);
			  
			  // Handle the hover event - overriding the default behaviour
			  s.addEventHandler("mouseover", onHover);
			  // Handle the leave event - overriding the default behaviour
			  s.addEventHandler("mouseleave", onLeave);
			  
			  // Draw the main chart
			  myChart.draw();
			  
			  // Event to handle mouse enter
			  function onHover(e) {
				
				// Get the properties of the selected shape
				var cx = parseFloat(e.selectedShape.attr("cx")),
					cy = parseFloat(e.selectedShape.attr("cy")),
					r = parseFloat(e.selectedShape.attr("r")),
					fill = e.selectedShape.attr("fill"),
					stroke = e.selectedShape.attr("stroke");
					
				// Set the size and position of the popup
				var width = 250,
					height = 50;
					 if ( $('#' +id).width() <= 768 ) {
					width = 150;
					height = 50;
				}
				var	x = (cx + r + width + 10 < svg.attr("width") ?
						  cx + r + 10 :
						  cx - r - width - 20);
					y = (cy - height / 2 < 0 ?
						  15 :
						  cy - height / 2);
				
				// Fade the popup fill mixing the shape fill with 80% white
				var popupFillColor = d3.rgb(
							d3.rgb(fill).r + 0.8 * (255 - d3.rgb(fill).r),
							d3.rgb(fill).g + 0.8 * (255 - d3.rgb(fill).g),
							d3.rgb(fill).b + 0.8 * (255 - d3.rgb(fill).b)
						);
				
				// Create a group for the popup objects
				popup = svg.append("g");
				
				// Add a rectangle surrounding the chart
				popup
				  .append("rect")
				  .attr("x", x + 5)
				  .attr("y", y - 5)
				  .attr("width", width)
				  .attr("height", height)
				  .attr("rx", 5)
				  .attr("ry", 5)
				  .style("fill", popupFillColor)
				  .style("stroke", stroke)
				  .style("stroke-width", 2);
				
				// Add the series value text
				popup
				  .append("text")
				  .attr("x", x + 10)
				  .attr("y", y + 10)
				  .text("Movie name:"+e.seriesValue[0])
				  .style("font-family", "sans-serif")
				  .style("font-size", 10)
				  .style("fill", stroke);
				  	popup
				  .append("text")
				  .attr("x", x + 10)
				  .attr("y", y + 25)
				  .text("Prediction:" + e.yValue)
				  .style("font-family", "sans-serif")
				  .style("font-size", 12)
				  .style("fill", stroke);
				  popup
				  .append("text")
				  .attr("x", x + 10)
				  .attr("y", y + 40) 
				  .text("Released Date:" + e.xValue)
				  .style("font-family", "sans-serif")
				  .style("font-size", 12)
				  .style("fill", stroke);
				
				d3.tsv("data/line-chart-data.tsv", function (data) {
				
				
				
				// Add a bar series, this can be changed to a line, area or bubble
				// by changing the plot parameter accordingly.
				var popUpSeries = tipChart.addSeries("SelectedSeries", dimple.plot.line);
				  popUpSeries.lineWeight = 1;
				  popUpSeries.lineMarkers = true;

				
				// Set the color to the stroke color of the selected node
				tipChart.assignColor("SelectedSeries", stroke, stroke);
				
				// Draw the mini chart
				

		});
				
			  };
			  
			  // Event to handle mouse exit
			  function onLeave(e) {
				// Remove the chart
				if (tipChart !== null) {
				  tipChart._group.remove();
				}
				// Remove the popup
				if (popup !== null) {
				  popup.remove();
				}
			  };
			
			});
			
			$('body').animate({
						scrollTop: 110
					}, 1000);
	}//end of loadTooltipChart
	
	function loadLineChart(id){
		if(id == undefined)return;
		var width =770, height = 500;
		if ( $(document).width() <= 768 ) {
			width = 450;
			height = 400;
		 }
		var svg = dimple.newSvg("#" + id, width, height);
			d3.tsv("data/line-chart-data.tsv", function (data) {

			  // Create and Position a Chart
			  var myChart = new dimple.chart(svg, data);
			  myChart.setBounds(60, 30, width-30, height-120);
			  var x = myChart.addCategoryAxis("x", "date")
			  myChart.addMeasureAxis("y", "expectedearning");

			  // Order the x axis by date
			  x.addOrderRule("date");

			  // Min price will be green, middle price yellow and max red
			 // myChart.addColorAxis("Price", ["green", "yellow", "red"]);

			  // Add a thick line with markers
			  var lines = myChart.addSeries(null, dimple.plot.line); 
			  lines.lineWeight = 1;
			  lines.lineMarkers = true;

			  // Draw the chart
			  myChart.draw();

		});
	
	}//end of loadLineChart
function loadLineChart1(id){
		if(id == undefined)return;
		var width =770, height = 500;
		if ( $(document).width() <= 768 ) {
			width = 450;
			height = 400;
		 }
		var svg = dimple.newSvg("#" + id, width, height);
			d3.tsv("data/line-chart-data1.tsv", function (data) {

			  // Create and Position a Chart
			  var myChart = new dimple.chart(svg, data);
			  myChart.setBounds(60, 30, width-30, height-120);
			  var x = myChart.addCategoryAxis("x", "date")
			  myChart.addMeasureAxis("y", "expectedearning");

			  // Order the x axis by date
			  x.addOrderRule("date");

			  // Min price will be green, middle price yellow and max red
			 // myChart.addColorAxis("Price", ["green", "yellow", "red"]);

			  // Add a thick line with markers
			  var lines = myChart.addSeries(null, dimple.plot.line); 
			  lines.lineWeight = 1;
			  lines.lineMarkers = true;

			  // Draw the chart
			  myChart.draw();

		});
	
	}//end of loadLineChart1
	
	function loadHeatMap(id){
	 $('#'+id).append('<span id="loading">Loading....</span>');


		var hits = {};
		var parade = window.histograms.states;
		for (var i = 0 ; i<parade.length ; i++)
			hits[parade[i].name] = parade[i].hits;

		var width = 850,
			height = 400,
			centered;
		if ( $(document).width() <= 768 ) {
			width = 480;
			height = 400;
		 }
		var projection = d3.geo.albersUsa()
			.scale(width)
			.translate([0, 0]);

		var path = d3.geo.path()
			.projection(projection);

		var svg = d3.select("."+id).append("svg")
			.attr("width", width)
			.attr("height", height)
			.attr("style","visibility:hidden");

		svg.append("rect")
			.attr("class", "background")
			.attr("width", width)
			.attr("height", height)
			.on("click", click);

		var g = svg.append("g")
			.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
		  .append("g")
			.attr("id", "states");

		d3.json("data/states.json", function(json) {
		  var heatmap = d3.scale.linear()
			.domain([0,d3.max(json.features, function(d) { return Math.log(hits[d.properties.abbr] || 1); })])
			.interpolate(d3.interpolateRgb)
			.range(["#ffffff","#073f07"])
		  var states = g.selectAll("path")
			.data(json.features)
			.enter().append("path")
			  .attr("d", path)
			  .attr("id", function(d) { return d.properties.abbr; })
			  .style("fill", function(d) { return heatmap(Math.log(hits[d.properties.abbr] || 1)); })
			  .on("click", click)
		  var labels = g.selectAll("text")
			.data(json.features)
			.enter().append("text")
			  .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
			  .attr("id", function(d) { return 'label-'+d.properties.abbr; })
			  .attr("dy", ".35em")
			  .on("click", this.click)
			  .text(function(d) { return d.properties.abbr; });
		});

		function click(d) {
		  var x = 0,
			  y = 0,
			  k = 1;

		  if (d && centered !== d) {
			var centroid = path.centroid(d);
			x = -centroid[0];
			y = -centroid[1];
			k = 4;
			centered = d;
		  } else {
			centered = null;
		  }

		  g.selectAll("path")
			  .classed("active", centered && function(d) { return d === centered; });
		  g.selectAll("text")
			  .text(function(d) { return d.properties.abbr; })
			  .classed("active",false);
		  if (centered) {
			  g.select("#label-"+centered.properties.abbr)
				  .text(function(d) { return d.properties.name+': '+(hits[d.properties.abbr]||'(none)'); })
				  .classed("active", centered && function(d) { return d === centered; });
		  }

		  g.transition()
			  .duration(1000)
			  .attr("transform", "scale(" + k + ")translate(" + x + "," + y + ")")
			  .style("stroke-width", 1.5 / k + "px");
		}

		setTimeout(function(){
			$('#va').hide();
			$('#loading').hide();
			svg.attr('style','visibility:visible');
			if($(document).width() <= 768){
				$('#'+id).append('<img src="img/trends.jpg" id="trendsImg" width="400" onclick="return false">');
			} else {
				$('#'+id).append('<img src="img/trends.jpg" id="trendsImg" onclick="return false">');
			}
			$('#trendsImg').css('margin-left','20px');
			$('#trendsImg').css('margin-top','40px');	
					
		},
		
		3000);
	}//loadHeatMap
	
	
	
function loadHeatMap1(id){
	 
	 $('#'+id).append('<span id="loading">Loading....</span>');


		var hits = {};
		var parade = window.histograms.states;
		for (var i = 0 ; i<parade.length ; i++)
			hits[parade[i].name] = parade[i].hits;

		var width = 350,
			height = 300,
			centered;
		if ( $(document).width() == 768 ) {
			width = 280;
			height = 300;
		 }
		var projection = d3.geo.albersUsa()
			.scale(width)
			.translate([0, 0]);

		var path = d3.geo.path()
			.projection(projection);

		var svg = d3.select("."+id).append("svg")
			.attr("width", width)
			.attr("height", height)
			.attr("style","visibility:hidden");

		svg.append("rect")
			.attr("class", "background")
			.attr("width", width)
			.attr("height", height)
			.on("click", click);

		var g = svg.append("g")
			.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
		  .append("g")
			.attr("id", "states");

		d3.json("data/states.json", function(json) {
		  var heatmap = d3.scale.linear()
			.domain([0,d3.max(json.features, function(d) { return Math.log(hits[d.properties.abbr] || 1); })])
			.interpolate(d3.interpolateRgb)
			.range(["#ffffff","#073f07"])
		  var states = g.selectAll("path")
			.data(json.features)
			.enter().append("path")
			  .attr("d", path)
			  .attr("id", function(d) { return d.properties.abbr; })
			  .style("fill", function(d) { return heatmap(Math.log(hits[d.properties.abbr] || 1)); })
			  .on("click", click)
		  var labels = g.selectAll("text")
			.data(json.features)
			.enter().append("text")
			  .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
			  .attr("id", function(d) { return 'label-'+d.properties.abbr; })
			  .attr("dy", ".35em")
			  .on("click", this.click)
			  .text(function(d) { return d.properties.abbr; });
		});

		function click(d) {
		  var x = 0,
			  y = 0,
			  k = 1;

		  if (d && centered !== d) {
			var centroid = path.centroid(d);
			x = -centroid[0];
			y = -centroid[1];
			k = 4;
			centered = d;
		  } else {
			centered = null;
		  }

		  g.selectAll("path")
			  .classed("active", centered && function(d) { return d === centered; });
		  g.selectAll("text")
			  .text(function(d) { return d.properties.abbr; })
			  .classed("active",false);
		  if (centered) {
			  g.select("#label-"+centered.properties.abbr)
				  .text(function(d) { return d.properties.name+': '+(hits[d.properties.abbr]||'(none)'); })
				  .classed("active", centered && function(d) { return d === centered; });
		  }

		  g.transition()
			  .duration(1000)
			  .attr("transform", "scale(" + k + ")translate(" + x + "," + y + ")")
			  .style("stroke-width", 1.5 / k + "px");
		}

		setTimeout(function(){
			var hideEle = id + ' ' + '#va';
			$('.' + hideEle ).hide();
			$('#loading').hide();
			svg.attr('style','visibility:visible');
			
			
		},
		
		3000);
	}//loadHeatMap
	function loadAreaChart(id){
		var width = 750,
			height = 500,
			centered;
		if ( $(document).width() <= 768 ) {
			width = 420;
			height = 500;
		 }		
		var margin = {top: 10, right: 10, bottom: 100, left: 40},
			margin2 = {top: 430, right: 10, bottom: 20, left: 40},
			height2 = height - margin2.top - margin2.bottom;

		var parseDate = d3.time.format("%b %Y").parse;

		var x = d3.time.scale().range([0, width]),
			x2 = d3.time.scale().range([0, width]),
			y = d3.scale.linear().range([height, 0]),
			y2 = d3.scale.linear().range([height2, 0]);

		var xAxis = d3.svg.axis().scale(x).orient("bottom"),
			xAxis2 = d3.svg.axis().scale(x2).orient("bottom"),
			yAxis = d3.svg.axis().scale(y).orient("left");

		var brush = d3.svg.brush()
			.x(x2)
			.on("brush", brushed);

		var area = d3.svg.area()
			.interpolate("monotone")
			.x(function(d) { return x(d.date); })
			.y0(height)
			.y1(function(d) { return y(d.price); });

		var area2 = d3.svg.area()
			.interpolate("monotone")
			.x(function(d) { return x2(d.date); })
			.y0(height2)
			.y1(function(d) { return y2(d.price); });

		var svg = d3.select("#"+id).append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom);

		svg.append("defs").append("clipPath")
			.attr("id", "clip")
		  .append("rect")
			.attr("width", width)
			.attr("height", height);

		var focus = svg.append("g")
			.attr("class", "focus")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var context = svg.append("g")
			.attr("class", "context")
			.attr("transform", "translate(" + margin2.left + "," + margin2.top + ")");

		d3.csv("data/area-chart-data.csv", type, function(error, data) {
		  x.domain(d3.extent(data.map(function(d) { return d.date; })));
		  y.domain([0, d3.max(data.map(function(d) { return d.price; }))]);
		  x2.domain(x.domain());
		  y2.domain(y.domain());

		  focus.append("path")
			  .datum(data)
			  .attr("class", "area")
			  .attr("d", area);

		  focus.append("g")
			  .attr("class", "x axis")
			  .attr("transform", "translate(0," + height + ")")
			  .call(xAxis);

		  focus.append("g")
			  .attr("class", "y axis")
			  .call(yAxis);

		  context.append("path")
			  .datum(data)
			  .attr("class", "area")
			  .attr("d", area2);

		  context.append("g")
			  .attr("class", "x axis")
			  .attr("transform", "translate(0," + height2 + ")")
			  .call(xAxis2);

		  context.append("g")
			  .attr("class", "x brush")
			  .call(brush)
			.selectAll("rect")
			  .attr("y", -6)
			  .attr("height", height2 + 7);
		});

		function brushed() {
		  x.domain(brush.empty() ? x2.domain() : brush.extent());
		  focus.select(".area").attr("d", area);
		  focus.select(".x.axis").call(xAxis);
		}

		function type(d) {
		  d.date = parseDate(d.date);
		  d.price = +d.price;
		  return d;
		}
	
	}// areachart