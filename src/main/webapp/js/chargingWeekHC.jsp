             
                 var title11 = {
                        text: 'Charging Status'   
                     };
                     var xAxis11 = {
                        categories: ['1', '2', '3', '4'],
 						title : {text:'Week'}
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
                           name: 'Charging Status Per Week',
                           data: [chargingDayList[i][0], chargingDayList[i][1], chargingDayList[i][2], chargingDayList[i][3]]
                        }
                     ];
                
                     var json11 = {};
                     json11.title = title11;
                     json11.xAxis = xAxis11;
                     json11.yAxis = yAxis11;  
                     json11.series = series11;
                     json11.plotOptions = plotOptions11;
                     
                     $('#chargingContainer').highcharts(json11);  