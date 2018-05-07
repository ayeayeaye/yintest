                	 var title5 = {
                        text: 'Battery Usage for One Week'   
                     };
                     var xAxis5 = {
						categories: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        title : {text:'Day'}
                     };
                     var yAxis5 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions5 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#686b6b',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series5 = [{
                           name: 'Battery Status Per Week', 
                           data: [ batteryDayList[i][0], batteryDayList[i][1], batteryDayList[i][2], batteryDayList[i][3],
                           		   batteryDayList[i][4], batteryDayList[i][5], batteryDayList[i][6]]
                        }
                     ];
                
                     var json5 = {};
                     json5.title = title5;
                     json5.xAxis = xAxis5;
                     json5.yAxis = yAxis5;  
                     json5.series = series5;
                     json5.plotOptions = plotOptions5;
                     
                     $('#batteryContainer').highcharts(json5); 