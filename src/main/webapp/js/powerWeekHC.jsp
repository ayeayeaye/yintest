                	 var title4 = {
                        text: 'Power Consumption for One Week'   
                     };
                     var xAxis4 = {
                        categories: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        title : {text:'Day'}
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
                           name: 'Power Status Per Week',
                           data: [ powerDayList[i][0], powerDayList[i][1], powerDayList[i][2], powerDayList[i][3],
                                   powerDayList[i][4], powerDayList[i][5], powerDayList[i][6]]
                        }
                     ];
                
                     var json4 = {};
                     json4.title = title4;
                     json4.xAxis = xAxis4;
                     json4.yAxis = yAxis4;  
                     json4.series = series4;
                     json4.plotOptions = plotOptions4;
                     
                     $('#powerContainer').highcharts(json4);  