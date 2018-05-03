                	 var title4 = {
                        text: 'Power Consumption'   
                     };
                     var xAxis4 = {
						categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        title : {text:'Month'}
                     };
                     var yAxis4 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions4 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#f4f442',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series4 = [{
                           name: 'Power Status Per Month',
                           data: [ powerDayList[i][0], powerDayList[i][1], powerDayList[i][2], powerDayList[i][3], powerDayList[i][4], powerDayList[i][5],
                        	       powerDayList[i][6], powerDayList[i][7], powerDayList[i][8], powerDayList[i][9], powerDayList[i][10], powerDayList[i][11]]
                        }
                     ];
                
                     var json4 = {};
                     json4.title = title4;
                     json4.xAxis = xAxis4;
                     json4.yAxis = yAxis4;  
                     json4.series = series4;
                     json4.plotOptions = plotOptions4;
                     
                     $('#powerContainer').highcharts(json4);  