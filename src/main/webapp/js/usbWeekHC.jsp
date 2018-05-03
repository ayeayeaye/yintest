                	 var title3 = {
                        text: 'USB Usage'   
                     };
                     var xAxis3 = {
                        categories: ['1', '2', '3', '4'],
                        title : {text:'Week'}
                     };
                     var yAxis3 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions3 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#41f489',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series3 = [{
                           name: 'USB Status Per Week',
                           data: [ usbDayList[i][0], usbDayList[i][1], usbDayList[i][2], usbDayList[i][3] ]
                        }
                     ];
                
                     var json3 = {};
                     json3.title = title3;
                     json3.xAxis = xAxis3;
                     json3.yAxis = yAxis3;  
                     json3.series = series3;
                     json3.plotOptions = plotOptions3;
                     
                     $('#usbContainer').highcharts(json3);