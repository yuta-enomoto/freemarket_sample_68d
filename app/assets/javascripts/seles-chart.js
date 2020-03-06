document.addEventListener("turbolinks:load", function() {
  var ctx = document.getElementById('myChart');
  check = function(obj) {
    if (obj) {
      new Chart(ctx, {
        type: 'pie',
        data: {
            labels: gon.category,
            datasets: [{
                label: '販売利益',
                data: gon.profit,
                backgroundColor: [
                    '#ff5890',
                    '#72bafd',
                    '#ebfa6a',
                    '#7bfa6a',
                    '#7275ff',
                    '#fc9960'
                ],
                borderWidth: 0
            }]
        },
        options: {
          responsive: false,
          maintainAspectRatio: false,
          tooltips: {
            enabled: true,
            callbacks: {
              label: function(tooltipItem, data) {
                var value = data.datasets[0].data[tooltipItem.index];
                if(parseInt(value) >= 1000){
                  return ' ¥ ' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                } else {
                  return ' ¥ ' + value;
                }
              }
            } 
          }, 
          title: {
            display: true,
            fontSize: 24,
            text: 'カテゴリ別 売上割合'
          },
          cutoutPercentage: 60,
          legend: {
            display: true,
          },
          scales: {
            yAxes: [{
              display: false,
              beginAtZero: true,
            }]
          },
        }
      });
    } else {
      return "";
    }
  };
  check(gon.category);
});