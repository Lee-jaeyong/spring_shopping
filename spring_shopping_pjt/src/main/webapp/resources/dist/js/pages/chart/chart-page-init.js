$(function() {
	var offset = 0;
	plot1();

	function plot1() {
		var cos = [];
		var a = [ 1, 2, 3, 1, 3, 5, 10, 3, 4, 1, 6, 3, 1, 2, 3, 1, 3, 5, 10, 3,
				4, 1, 6, 3 ];
		// a 는 데이터베이스에서 가져온 값들

		for (var i = 0; i < a.length; i++) {
			cos.push([ i * 1, a[i] * 1 ]);
		}
		cos.push([ a.length, 1 * 1 ]);
		var options = {
			series : {
				lines : {
					show : true
				},
				points : {
					show : true
				}
			},
			grid : {
				hoverable : true
			},
			colors : [ "#ee7951", "#4fb9f0" ],
			grid : {
				color : "#AFAFAF",
				hoverable : true,
				borderWidth : 0,
				backgroundColor : '#FFF'
			},
			tooltip : true,
			tooltipOpts : {
				content : "%y 개",
				shifts : {
					x : -60,
					y : 25
				}
			}
		};
		var plotObj = $.plot($("#flot-line-chart"), [ {
			data : cos,
		} ], options);
	}

});