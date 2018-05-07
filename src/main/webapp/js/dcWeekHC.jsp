                 var title2 = {
                        text: 'DC Usage for One Week'   
                     };
                     var xAxis2 = {
                        categories: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        title : {text:'Day'}
                     };
                     var yAxis2 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions2 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },   
                           enableMouseTracking: true
                        }
                     };
                     var series2 = [{
                           name: 'DC Status Per Week',
                           data: [ dcDayList[i][0], dcDayList[i][1], dcDayList[i][2], dcDayList[i][3],
                            	  dcDayList[i][4], dcDayList[i][5],dcDayList[i][6]]
                        }
                     ];
                
                     var json2 = {};
                     json2.title = title2;
                     json2.xAxis = xAxis2;
                     json2.yAxis = yAxis2;  
                     json2.series = series2;
                     json2.plotOptions = plotOptions2;
                     
                     $('#dcContainer').highcharts(json2);