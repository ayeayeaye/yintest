             
                 var title1 = {
                        text: 'Charging Status for One Day'   
                     };
                     var xAxis1 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11','12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23'],
 						title : {text:'Hour'}
                     };
                     var yAxis1 = {
                        title: { text: 'mA'}
                     };                     

                     var plotOptions1 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },  
                           color:'#f45042',                        	  
                           enableMouseTracking: true
                        }
                     };
                     var series1 = [{
                           name: 'Charging Status Per Hour',
                           data: [chargingDayList[i][0], chargingDayList[i][1], chargingDayList[i][2], chargingDayList[i][3], chargingDayList[i][4], chargingDayList[i][5], 
                        	      chargingDayList[i][6], chargingDayList[i][7], chargingDayList[i][8], chargingDayList[i][9], chargingDayList[i][10], chargingDayList[i][11],
                        	      chargingDayList[i][12], chargingDayList[i][13], chargingDayList[i][14], chargingDayList[i][15], chargingDayList[i][16], chargingDayList[i][17],
                        	      chargingDayList[i][18], chargingDayList[i][19], chargingDayList[i][20], chargingDayList[i][21], chargingDayList[i][22], chargingDayList[i][23]]
                        }
                     ];
                
                     var json1 = {};
                     json1.title = title1;
                     json1.xAxis = xAxis1;
                     json1.yAxis = yAxis1;  
                     json1.series = series1;
                     json1.plotOptions = plotOptions1;
                     
                     $('#chargingContainer').highcharts(json1);  