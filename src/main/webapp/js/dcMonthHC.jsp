                 var title2 = {
                        text: 'DC Usage for One Month'
                     };
                     var xAxis2 = {
                        categories: ['1', '2', '3', '4'],
                        title : {text:'Week'}
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
                           name: 'DC Status Per Month',
                           data: [ dcDayList[i][0], dcDayList[i][1], dcDayList[i][2], dcDayList[i][3]]
                        }
                     ];
                
                     var json2 = {};
                     json2.title = title2;
                     json2.xAxis = xAxis2;
                     json2.yAxis = yAxis2;  
                     json2.series = series2;
                     json2.plotOptions = plotOptions2;
                     
                     $('#dcContainer').highcharts(json2);