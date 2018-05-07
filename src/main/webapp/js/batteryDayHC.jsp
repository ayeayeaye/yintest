                	 var title5 = {
                        text: 'Battery Usage  for One Day'   
                     };
                     var xAxis5 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23'],
                        title : {text:'Hour'}
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
                           name: 'Battery Status Per Hour', 
                           data: [ batteryDayList[i][0], batteryDayList[i][1], batteryDayList[i][2], batteryDayList[i][3], batteryDayList[i][4], batteryDayList[i][5],
                        	       batteryDayList[i][6], batteryDayList[i][7], batteryDayList[i][8], batteryDayList[i][9], batteryDayList[i][10], batteryDayList[i][11],
                        	       batteryDayList[i][12], batteryDayList[i][13], batteryDayList[i][14], batteryDayList[i][15], batteryDayList[i][16], batteryDayList[i][17],
                        	       batteryDayList[i][18], batteryDayList[i][19], batteryDayList[i][20], batteryDayList[i][21], batteryDayList[i][22], batteryDayList[i][23] ]
                        }
                     ];
                
                     var json5 = {};
                     json5.title = title5;
                     json5.xAxis = xAxis5;
                     json5.yAxis = yAxis5;  
                     json5.series = series5;
                     json5.plotOptions = plotOptions5;
                     
                     $('#batteryContainer').highcharts(json5); 