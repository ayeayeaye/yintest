             
                 var title11 = {
                        text: 'Charging Status'   
                     };
                     var xAxis11 = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
 						title : {text:'Month'}
                     };
                     var yAxis11 = {
                        title: { text: 'mA'}
                     };                     

                     var plotOptions11 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },  
                           color:'#f45042',                        	  
                           enableMouseTracking: true
                        }
                     };
                     var series11 = [{
                           name: 'Charging Status Per Month',
                           data: [chargingDayList[i][0], chargingDayList[i][1], chargingDayList[i][2], chargingDayList[i][3], chargingDayList[i][4], chargingDayList[i][5], 
                        	      chargingDayList[i][6], chargingDayList[i][7], chargingDayList[i][8], chargingDayList[i][9], chargingDayList[i][10], chargingDayList[i][11]]
                        }
                     ];
                
                     var json11 = {};
                     json11.title = title11;
                     json11.xAxis = xAxis11;
                     json11.yAxis = yAxis11;  
                     json11.series = series11;
                     json11.plotOptions = plotOptions11;
                     
                     $('#chargingContainer').highcharts(json11);  