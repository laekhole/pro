(function ($) {


    // Single Bar Chart
// 월별 봉사 수 차트 데이터 가져오기
fetch('/admin/ChartRecruitBoardCount')
    .then(response => response.json())
    .then(data => {
        var ctx4 = $("#bar-chart").get(0).getContext("2d");
        var myChart4 = new Chart(ctx4, {
            type: "bar",
            data: {
                labels: data.selectMonthRecruitCount.map(item => item.month), // 월별 레이블
                datasets: [{
					label: "월 단위 봉사 집계",
                    backgroundColor: "rgba(0, 156, 255, .7)",
                    data: data.selectMonthRecruitCount.map(item => item.totalRecruits) // 월별 봉사 수 데이터
                }]
            },
            options: {
                responsive: true
            }
        });
    });


    // Doughnut Chart
fetch('/admin/ChartCategoryCount') 
    .then(response => response.json())
    .then(data => {
        // 필터링 조건에 따라 데이터 필터링
        const filteredData = data.selectCategoryCount.filter(item => item.codeGroup === '0001');

        var ctx = document.getElementById("doughnut-chart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "doughnut",
            data: {
                labels: filteredData.map(item => item.codeName), // 필터링된 데이터의 레이블
                datasets: [{
                   backgroundColor: filteredData.map((item, index) => {
                        // 여기서 각 데이터 포인트에 대한 색상을 설정합니다.
                        const colors = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'];
                        return colors[index % colors.length]; // 색상 배열을 순환하며 적용
                    }),
                    data: filteredData.map(item => item.categoryCount) // 필터링된 데이터의 값
                }]
            },
            options: {
                responsive: true
            }
        });
    });


    
})(jQuery);

