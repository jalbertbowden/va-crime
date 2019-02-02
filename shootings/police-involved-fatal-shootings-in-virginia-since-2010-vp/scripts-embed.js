/* I'm the first to admit that I'm still learning this stuff, so if you
want talk coding or have a tip/question, shoot me an email at will.houp@pilotonline.com */

var ww = document.getElementById("map").clientWidth,
    width = ww,
    height = ww > 475 ? 380 : 250,
    chartHeight = ww > 475 ? 500 : 300,
    center = [width / 2, height / 2],
    windowResize,
    format = d3.time.format("%B %d, %Y, "),
    decedent_names = [],
    age_cat,weapon,region,charges,mental;
    data_categories = ["Asian" , "Black" , "central-virginia" , "conviction-charges" , "fake-gun" , "Female" , "force-justified" , "force-pending" , "force-unjustified" , "force-unknown" , "Gun" , "hampton-roads" , "has-mental-health-issues" , "Hispanic" , "Knife" , "Male" , "no-charges" , "no-injuries" , "northern-virginia" , "officer-charges" , "officer-injured" , "officer-killed" , "other-weapon" , "p17" , "p18" , "p2010" , "p2011" , "p2012" , "p2013" , "p2014" , "p2015" , "p2016" , "p30" , "p50" , "pending-charges" , "pled-guilty" , "shenandoah-valley" , "southwestern-virginia" , "Unarmed" , "Unknown" , "unknown-charges" , "unknown-mental-health-issues" , "Vehicle" , "White"],
    chart_filters = {},
    zoomScale = 2,
    zoomWidth = ww < 375 ? (width - zoomScale * width) * 1.6 : (width - zoomScale * width) * 1.3,
    zoomHeight = (height - zoomScale * height) + 10,
    spanDomain = [1, 2, 4, 6, 8, 10, 12, 14, 16];

var color = d3.scale.threshold()
    .domain([1, 2, 4, 6, 8, 10, 12, 14, 16])
    .range(["#ebebeb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#810f7c","#4d004b" , "#30004B"]);

var chartColor = d3.scale.category10();

var projection = d3.geo.conicConformal()
    .parallels([38 + 02 / 60, 39 + 12 / 60])
    .rotate([78 + 30 / 60, 0])
    .scale(6800)
    .translate([0, 0]);

if (ww < 750 && ww > 500) {
  projection.scale(4500);
} else if (ww <= 500 && ww > 475) {
  projection.scale(3450);
} else {
  projection.scale(6500);
}

var zoom = d3.behavior.zoom()
    .translate([zoomWidth,zoomHeight])
    .scale(1.65)
    .on("zoom", zoomed)

var rangeLength = ww > 320 ? 250 : 200;

var x = d3.scale.linear()
    .domain([0, 13])
    .range([0, rangeLength]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom")
    .tickSize(8)
    .tickValues(color.domain());

var svg = d3.select(".state-map").append("svg")
    .attr("width", width)
    .attr("height", height);

var chartVis = d3.select(".database").append("svg")
    .attr("width", width)
    .attr("height", chartHeight)
    .style("display" , "none");


var area = svg.append("g")

var q = d3_queue.queue()
     .defer(d3.json, "//pilotonline.com/app/media/content/pilotonline/2016/04/police-shootings/database/virginia.json")
     .defer(d3.csv, "//pilotonline.com/app/media/content/pilotonline/2016/04/police-shootings/database/city.csv")
     .defer(d3.csv, "//pilotonline.com/app/media/content/pilotonline/2016/04/police-shootings/database/data.csv")
    .await(ready);

var path = d3.geo.path()
    .projection(projection);

var g = svg.append("g");

if (ww <= 475) {
  $('#map').addClass("mobile-zooming")
  svg
    .call(zoom)
    .call(zoom.event)
    .attr("transform", "translate("+zoomWidth+","+zoomHeight+") scale("+zoomScale+")")

var scaleKey = d3.select(".scale-keys")

  scaleKey.selectAll(".scale-key")
      .data(color.range().map(function(d, i) {
          return {
            x0: i ? x(color.domain()[i - 1]) : x.range()[0],
            x1: i < color.domain().length ? x(color.domain()[i]) : x.range()[1],
            z: d,
            text: spanDomain[i]
          };
        }))
      .enter().append("span")
        .attr('class' , 'scale-key')
        .style("background", function(d) { return d.z; })
        .text(function(d) {
          return d.text })
} else {

  g
    .attr("class", "key")
    .attr("transform", "translate(10,50)");

g.selectAll("rect")
    .data(color.range().map(function(d, i) {
      return {
        x0: i ? x(color.domain()[i - 1]) : x.range()[0],
        x1: i < color.domain().length ? x(color.domain()[i]) : x.range()[1],
        z: d
      };
    }))
  .enter().append("rect")
    .attr("height", 8)
    .attr('class' , 'rect')
    .attr("x", function(d) { return d.x0; })
    .attr("width", function(d) {
      return ww > 330 ? "50px" : "30px"
    })
    .style("fill", function(d) { return d.z; });

g.call(xAxis).append("text")
    .attr("class", "caption")
    .attr("y", -6)
    .attr("id" , "area")
    .style('font-size' , '12px')
    .style('font-weight' , 'bold')
    .text("Police-involved fatal shootings since 2010 by location");

}

function ready(error, topo, city, data) {
  if (error) throw error;

  data.forEach(function(d) {
    d.agency_count = +d.agency_count
    d.age = +d.age

    decedent_names.push(d.name);

      if (18 <= d.age && d.age <= 29) {
        age_cat = 'p18'
      } else if (d.age > 29 && d.age < 50) {
        age_cat = 'p30'
      } else if (d.age > 50) {
        age_cat = 'p50'
      } else if (d.age < 18) {
        age_cat = 'p17'
      }
    d.age_category = age_cat;

      if (d.weapon === "Fake gun" || d.weapon === "Mock gun" || d.weapon == "Toy Gun" || d.weapon === "BB Gun"){
        weapon = 'fake-gun'
      } else if (d.weapon === "Car") {
        weapon = "Vehicle"
      } else if (d.weapon === "Pellet Pistol" || d.weapon === "Sword" || d.weapon === "Ax" || d.weapon === "Blunt weapon" || d.weapon === "Sign") {
        weapon = "other-weapon"
      } else if (d.weapon === "Knives" || d.weapon === "Knife, scissors") {
        weapon = "Knife"
      } else {
        weapon = d.weapon
      }
    d.weapon = weapon;

      region = d.region;
      region = region.replace(/\s+/g, '-').toLowerCase();
    d.region = region;

      if (d.mental_health_issues === "Unknown" || d.mental_health_issues === "No") {
        mental = "unknown-mental-health-issues"
      } else {
        mental = "has-mental-health-issues"
      }
    d.mental_health_issues = mental;
  })

  var nest_race = d3.nest()
      .key(function(d) { return d.race })
      .rollup(function(leaves) { return leaves.length })
      .entries(data);

  var list_race = d3.select(".filtering-tools .race").append("ul")
        .attr("class" , "select race dropdown-menu")
        .attr("id" , "race");

  list_race.selectAll("a.dropdown-item")
      .data(nest_race)
    .enter().append("li").append("a")
      .attr("class" , "dropdown-item")
      .attr("value" , function(d) { return d.key })
      .attr("id" , function(d) { return d.key })
      .attr("title" , function(d) { return d.key })
      .attr("name" , "race")
      .html(function(d) {
        return d.key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
    });

  var nest_gender = d3.nest()
      .key(function(d) { return d.gender })
      .rollup(function(leaves) { return leaves.length })
      .entries(data);

  var list_gender = d3.select(".filtering-tools .gender").append("ul")
        .attr("class" , "select gender dropdown-menu")
        .attr("id" , "gender");

  list_gender.selectAll("a.dropdown-item")
      .data(nest_gender)
    .enter().append("li").append("a")
      .attr("class" , "dropdown-item")
      .attr("value" , function(d) { return d.key })
      .attr("id" , function(d) { return d.key })
      .attr("title" , function(d) { return d.key })
      .attr("name" , "gender")
      .html(function(d) {
        return d.key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
      });

  var nest_year = d3.nest()
      .key(function(d) { return d.year }).sortKeys(d3.descending)
      .rollup(function(leaves) { return leaves.length })
      .entries(data);

  var list_year = d3.select(".filtering-tools .year").append("ul")
        .attr("class" , "select year dropdown-menu")
        .attr("id" , "year");

  list_year.selectAll("a.dropdown-item")
      .data(nest_year)
    .enter().append("li").append("a")
      .attr("class" , "dropdown-item")
      .attr("value" , function(d) { return "p" + d.key })
      .attr("id" , function(d) { return "p" + d.key })
      .attr("title" , function(d) { return d.key })
      .attr("name" , "year")
      .html(function(d) {
        return d.key + "<span class='key-totals' id='key-p" + d.key + "'>" + d.values + "</span>"
      });

  var nest_force = d3.nest()
      .key(function(d) { return d.use_of_force_justified })
      .rollup(function(leaves) { return leaves.length })
      .entries(data);

  var list_force = d3.select(".filtering-tools .use-of-force").append("ul")
        .attr("class" , "select use-of-force dropdown-menu")
        .attr("id" , "force");

  list_force.selectAll("a.dropdown-item")
      .data(nest_force)
    .enter().append("li").append("a")
      .attr("class" , "dropdown-item")
      .attr("value" , function(d) {
          var force;
          if (d.key === 'No') {
            key = 'force-unjustified'
          } else if (d.key === 'Pending'){
            key = 'force-pending'
          } else if (d.key === 'Unknown') {
            key = 'force-unknown'
          } else {
            key = 'force-justified'
          }
          return key;
      })
      .attr("id" , function(d) {
          var key;
          if (d.key === 'No') {
            key = 'force-unjustified'
          } else if (d.key === 'Pending'){
            key = 'force-pending'
          } else if (d.key === 'Unknown') {
            key = 'force-unknown'
          } else {
            key = 'force-justified'
          }
          return key;
      })
      .attr("title" , function(d) {
          var key;
          if (d.key == "Yes" || d.key == "yes") {
            key = "Use of force justified"
          } else if (d.key === "No") {
            key = "Use of force not justified"
          } else if (d.key === "Pending") {
            key = "Investigation ongoing"
          } else if (d.key === "Unknown") {
            key = "Outcome unknown"
          } else {
            key = d.key;

          }
          return key;
      })
      .attr("name" , "force")
      .html(function(d) {
          var key,force;
          if (d.key === "Yes" || d.key === "yes") {
            key = "Justified"
            force = 'force-justified'
          } else if (d.key === "No") {
            key = "Not justified"
            force = 'force-unjustified'
          } else if (d.key === "Pending") {
            key = "Investigation ongoing"
            force = 'force-pending'
          } else if (d.key === "Unknown") {
            key = "Outcome unknown"
            force = 'force-unknown'
          } else { return false; }
          return key + " <span class='key-totals' id='key-" + force.toLowerCase() + "'>" + d.values + "</span>"
      });

  var nest_age = d3.nest()
        .key(function(d) { return d.age_category }).sortKeys(d3.descending)
        .rollup(function(leaves) { return leaves.length })
        .entries(data);

  var list_age = d3.select(".filtering-tools .age").append("ul")
        .attr("class" , "select age dropdown-menu")
        .attr("id" , "age_category");

  list_age.selectAll("a.dropdown-item")
      .data(nest_age)
    .enter().append("li").append("a")
      .attr("class" , "dropdown-item")
      .attr("value" , function(d) { return d.key })
      .attr("id" , function(d) { return d.key })
      .attr("title" , function(d) {
        var key;
        if (d.key == "p50") {
          key = "50 and up"
        } else if (d.key == "p30") {
          key = "30 to 49"
        } else if (d.key == "p18") {
          key = "18 to 29"
        } else if (d.key == "p17") {
          key = "Under 18"
        }
        return key;
      })
      .attr("name" , "age_category")
      .html(function(d) {
        var key;
        if (d.key == "p50") {
          key = "50 and up"
        } else if (d.key == "p30") {
          key = "30 to 49"
        } else if (d.key == "p18") {
          key = "18 to 29"
        } else if (d.key == "p17") {
          key = "Under 18"
        }
        return key + " <span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
      });

  var nest_weapon = d3.nest()
        .key(function(d) { return d.weapon })
        .rollup(function(leaves) { return leaves.length })
        .entries(data);

  var list_weapon = d3.select(".filtering-tools .weapon").append("ul")
        .attr("class" , "select weapon dropdown-menu")
        .attr("id" , "weapon");

    list_weapon.selectAll('a.dropdown-item')
        .data(nest_weapon)
    .enter().append("li").append("a")
        .attr("class" , "dropdown-item")
        .attr("value" , function(d) { return d.key })
        .attr("id" , function(d) { return d.key })
        .attr("name" , "weapon")
        .attr("title" , function(d) {
          var key;
          if (d.key == "fake-gun") {
            key = "Fake gun"
          } else if (d.key == "other-weapon") {
            key = "Other weapon"
          } else {
            key = d.key
          }
          return key
        })
        .html(function(d) {
          var key;
          if (d.key == "fake-gun") {
            key = "Fake gun"
          } else if (d.key == "other-weapon") {
            key = "Other weapon"
          } else {
            key = d.key
          }
          return key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
        });

  var nest_region = d3.nest()
        .key(function(d) { return d.region })
        .rollup(function(leaves) { return leaves.length })
        .entries(data);

  var list_region = d3.select(".filtering-tools .region").append("ul")
        .attr("class" , "select region dropdown-menu")
        .attr("id" , "region");

    list_region.selectAll("a.dropdown-item")
        .data(nest_region)
      .enter().append("li").append("a")
        .attr("class" , "dropdown-item")
        .attr("value" , function(d) { return d.key })
        .attr("id" , function(d) { return d.key })
        .attr("name" , "region")
        .attr("title" , function(d) {
          var key;
          if (d.key == "hampton-roads") {
            key = "Hampton Roads"
          } else if (d.key == "shenandoah-valley") {
            key = "Shenandoah Valley"
          } else if (d.key == "northern-virginia") {
            key = "Northern Virginia"
          } else if (d.key == "southwestern-virginia") {
            key = "Southwestern Virginia"
          } else if (d.key == "central-virginia") {
            key = "Central Virginia"
          } else { false; }
          return key
        })
        .html(function(d) {
          var key;
          if (d.key == "hampton-roads") {
            key = "Hampton Roads"
          } else if (d.key == "shenandoah-valley") {
            key = "Shenandoah Valley"
          } else if (d.key == "northern-virginia") {
            key = "Northern Virginia"
          } else if (d.key == "southwestern-virginia") {
            key = "Southwestern Virginia"
          } else if (d.key == "central-virginia") {
            key = "Central Virginia"
          } else { false; }
          return key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
        });

  var nest_injured = d3.nest()
        .key(function(d) {
          var injury;
          if (d.officer_injured === 'Yes') {
            injury = 'officer-injured'
          } else if (d.officer_injured === 'No') {
            injury = 'no-injuries'
          } else if (d.officer_injured === 'officer killed') {
            injury = 'officer-killed'
          } else { false; }
          return injury;
        })
        .rollup(function(leaves) { return leaves.length })
        .entries(data);

  var list_injured = d3.select(".filtering-tools .officer-injured").append("ul")
        .attr("class" , "select officer-injured dropdown-menu")
        .attr("id" , "officer-injuries");

    list_injured.selectAll("a.dropdown-item")
        .data(nest_injured)
      .enter().append("li").append("a")
        .attr("class" , "dropdown-item")
        .attr("value" , function(d) { return d.key })
        .attr("id" , function(d) { return d.key })
        .attr("name" , "officer-injured")
        .attr("title" , function(d) {
          var injury;
          if (d.key == "no-injuries") {
            injury = "Officer(s) not injured"
          } else if (d.key == "officer-injured") {
            injury = "Officer(s) injured"
          } else if (d.key == "officer-killed") {
            injury = "Officer(s) killed"
          }
          return injury
        })
        .html(function(d) {
          var key;
          if (d.key == "no-injuries") {
            key = "Officer(s) not injured"
          } else if (d.key == "officer-injured") {
            key = "Officer(s) injured"
          } else if (d.key == "officer-killed") {
            key = "Officer(s) killed"
          }
          return key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
        });

  var nest_outcomes = d3.nest()
        .key(function(d) { return d.officer_charges_simple })
        .rollup(function(leaves) { return leaves.length })
        .entries(data);

  var list_outcomes = d3.select(".filtering-tools .investigation-outcomes").append("ul")
        .attr("class" , "select investigation-outcomes dropdown-menu")
        .attr("id" , "investigation-outcomes");

    list_outcomes.selectAll("a.dropdown-item")
        .data(nest_outcomes)
      .enter().append("li").append("a")
        .attr("class" , "dropdown-item")
        .attr("value" , function(d) { return d.key })
        .attr("id" , function(d) { return d.key })
        .attr("name" , "investigation-outcomes")
        .attr("title" , function(d) {
          var charges;
          if (d.key == "no-charges") {
            charges = "Officer not charged"
          } else if (d.key == "pending-charges") {
            charges = "Outcome pending"
          } else if (d.key == "conviction-charges") {
            charges = "Officer convicted"
          } else if (d.key == "officer-charges") {
            charges = "Officer charged"
          } else if (d.key == "unknown-charges") {
            charges = "Outcome unknown"
          } else if (d.key == "pled-guilty") {
            charges = "Pled guilty"
          }
          return charges;
        })
        .html(function(d) {
          var key;
          if (d.key == "no-charges") {
            key = "Officer not charged"
          } else if (d.key == "pending-charges") {
            key = "Outcome pending"
          } else if (d.key == "conviction-charges") {
            key = "Officer convicted"
          } else if (d.key == "officer-charges") {
            key = "Officer charged"
          } else if (d.key == "unknown-charges") {
            key = "Outcome unknown"
          } else if (d.key == "pled-guilty") {
            key = "Pled guilty"
          }
          return key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
        });

  var nest_mental_health = d3.nest()
      .key(function(d) { return d.mental_health_issues })
      .rollup(function(leaves) { return leaves.length } )
      .entries(data);

  var list_mental_health = d3.select(".filtering-tools .mental-illness").append("ul")
        .attr("class" , "select mental-illness dropdown-menu")
        .attr("id" , "mental-illness");

    list_mental_health.selectAll("a.dropdown-item")
        .data(nest_mental_health)
      .enter().append("li").append("a")
        .attr("class" , "dropdown-item")
        .attr("value" , function(d) { return d.key })
        .attr("id" , function(d) { return d.key })
        .attr("name" , "mental-illness")
        .attr("title" , function(d) {
          var mental_health;
          if (d.key == "has-mental-health-issues") {
            mental_health = "Known mental illness"
          } else {
            mental_health = "No or unknown mental illness"
          }
          return mental_health;
        })
        .html(function(d) {
          var key;

          if (d.key == "has-mental-health-issues") {
            key = "Yes"
          } else {
            key = "No or unknown"
          }

          return key + "<span class='key-totals' id='key-" + d.key + "'>" + d.values + "</span>"
        });

$('.dropdown-toggle').append(' <i class="fa fa-plus-circle" aria-hidden="true"></i>');
$('.dropdown-item').addClass("not-selected");
$('.dropdown-item').click(function() {
  $(this).parent().children().removeClass('selected').addClass('not-selected');
  $(this).removeClass("not-selected").addClass("selected");
});


if (ww < 700 && ww > 515) {
  $('#region').addClass("dropdown-menu-right")
} else if (ww < 515 && ww > 430) {
  $('#age, #weapon, #mental-illness').addClass("dropdown-menu-right");
} else if (ww < 430 && ww > 335) {
  $('#investigation-outcomes, #age').addClass("dropdown-menu-right");
} else if (ww < 335) {
    $('#force, #officer-injuries').addClass("dropdown-menu-right");
  }

$(window).resize(function() {
  windowResize = $(this).width();

  if (windowResize < 700 && windowResize > 515) {
    $('#region').addClass("dropdown-menu-right");
  } else if (windowResize < 515 && windowResize > 430) {
    $('#age, #weapon, #mental-illness').addClass("dropdown-menu-right");
  } else if (windowResize < 430 && windowResize > 335) {
    $('#investigation-outcomes, #age').addClass("dropdown-menu-right");
  } else if (windowResize < 335) {
    $('#force, #officer-injuries').addClass("dropdown-menu-right");
    $('#age').removeClass("dropdown-menu-right");
  }
})

var filteringList = $('.select');

$(filteringList).click(function() {
  var selectedFilters = {},
      title = $(this).find(".selected").attr("id"),
      name = $(this).find(".selected").attr("title"),
      selected_id = $(this).parent().find(".select").attr("id"),
      categories = [],
      filteredResults = $('.decedent');

  $('.titles .btn-popup-filter[value="' + selected_id + '"]').remove();
  $("#city-clear, .county-popup").hide();
  $('.totals').show();

  if (name !== undefined) {
    $('.titles').append('<button class="btn btn-warning btn-popup-filter" value="' + selected_id + '" name="' + title + '">' + name + ' <i class="fa fa-times"></i></button>')
  }

  filteringList.find(".selected").each(function() {
    if (!selectedFilters.hasOwnProperty($(this).attr("name"))) {
      selectedFilters[$(this).attr("name")] = [];
    }
      selectedFilters[$(this).attr("name")].push($(this).attr("value"))
  })

  $.each(selectedFilters, function(name, filterValues) {
    filteredResults = filteredResults.filter(function() {
      var matched = false,
        currentFilterValues = $(this).data('category').split(' ');

      $.each(currentFilterValues, function(_, currentFilterValue) {
        if ($.inArray(currentFilterValue, filterValues) != -1) {
          matched = true;
          return false;
        }
      });
      return matched;
    });
  });

  chart_filters = selectedFilters

  $('.btn-popup-filter').click(function() {
    var id = $(this).attr("name");
    $(this).remove();


    if ($('.btn-popup-filter').length > 0) {
      var index = $('.btn-popup-filter').not(this);

      $('.btn-popup-filter').not(this).each(function(d,i) {
        categories.push($(i).attr("name"))
      })

      for (var k = chart_filters.length; k >= 0; k--) {
        if (chart_filters[k] == id) {
          chart_filters.splice(k, 1)
        }
      }

      var people = '';
      categories.forEach(function(d,i) {
        people += '[data-category*="' + categories[i] + '"]'
      })

      $('.decedent' + people).show();
    }
    else {
      $('.decedent').show();
    }

  delete selectedFilters[$(this).attr("value")]
  chart_filters = selectedFilters
  $('#' + id).removeClass('selected').addClass('not-selected')

  var visible = $('.decedent:visible').length;
  $('#visible').text(visible);
    for (var j = 0, l = data_categories.length; j < l; j++) {
      $('#key-' + data_categories[j]).text($(".decedent[data-category*='" + data_categories[j] + "']:visible").length)
    }
    spans.each(function(i) {
        if (spans[i].innerHTML.indexOf("0") == 0) {
          $(this).parent().addClass("no-results")
      } else {
        $(this).parent().removeClass("no-results")
      }
    })

  })
$('.decedent').hide().filter(filteredResults).show();
$('#visible').text(filteredResults.length);

for (var j = 0, l = data_categories.length; j < l; j++) {
  $('#key-' + data_categories[j]).text($(".decedent[data-category*='" + data_categories[j] + "']:visible").length)
}

var spans = $('.key-totals')

spans.each(function(i) {
    if (spans[i].innerHTML.indexOf("0") == 0) {
      $(this).parent().addClass("no-results")
  } else {
    $(this).parent().removeClass("no-results")
  }
})

})


  var state = topojson.feature(topo, topo.objects.virginia),
      bounds = path.bounds(state);

  projection
      .translate([width / 2 - (bounds[0][0] + bounds[1][0]) / 2, height / 2 - (bounds[0][1] + bounds[1][1]) / 2]);

  area.selectAll('.county')
      .data(state.features)
    .enter().append('path')
      .attr('class', "county")
      .style('fill' , function(d) { return color(d.properties.deaths) })
      .on('mouseover', mouseovered)
      .on('click', clicked)
      .attr('d', path)

  area.append("path")
      .datum(topojson.mesh(topo, topo.objects.virginia, function(a, b) { return a !== b; }))
      .attr("class", "county-border")
      .style("stroke-width" , 1.01 / zoom.scale())
      .attr("d", path);

  area.append("path")
      .datum(topojson.mesh(topo, topo.objects.virginia, function(a, b) { return a === b; }))
      .attr("class", "state-border")
      .style("stroke-width" , 1.01 / zoom.scale())
      .attr("d", path)

  area.append('g')
  area.selectAll("circle")
    .data(city)
    .attr('r', 5)
  .enter().append("text")
    .text(function(d) { return d.name})
    .attr("d", path)
    .attr("class", "place")
    .attr("transform", function(d) {return "translate(" + projection([d.longitude,d.latitude]) + ")";});

  var database = d3.select(".database");

  database.selectAll(".decedent")
      .data(data)
    .enter().append("section")
      .attr("title" , function(d) { return d.location })
      .attr("name" , function(d) { return d.name })
      .attr("class" , "decedent col-xs-12")
      .attr('data-category' , function(d) {
          var force, injury;
          if (d.use_of_force_justified === 'No') {
            force = ' force-unjustified '
          } else if (d.use_of_force_justified === 'Pending'){
            force = ' force-pending '
          } else if (d.use_of_force_justified === 'Unknown') {
            force = ' force-unknown '
          } else {
            force = ' force-justified '
          }
          if (d.officer_injured === 'Yes') {
            injury = 'officer-injured'
          } else if (d.officer_injured === 'No') {
            injury = 'no-injuries'
          } else if (d.officer_injured === 'officer killed') {
            injury = 'officer-killed'
          } else { false; }
        return d.gender + ' ' + d.race + ' ' + d.region + ' p' + d.year + " " + d.age_category + " " + d.weapon + force + d.officer_charges_simple + ' ' + injury + ' ' + d.mental_health_issues ;
        })
      .html(function(d,i) {
       var armed, image, age, identified, race, officerHurt, force, agency, expo, review, charges, weapon;
        if (d.race === 'Unknown') {
          race = 'unknown race'
        } else { race = d.race }

        if (d.weapon == "fake-gun") {
          weapon = "fake gun"
        } else if (d.weapon == "other-weapon") {
          weapon = "other weapon"
        } else { weapon = d.weapon }

       if (18 <= d.age && d.age <= 29) {
        age = "18 to 29"
       } else if (d.age < 18) {
        age = "17 and younger"
       } else if (d.age > 29 && d.age < 50) {
        age = "30 to 49"
       } else if (d.age > 50) {
        age = "50 and older"
       }

        if (d.officer_identified_to_public == 'Unknown' || d.officer_identified_to_public == 'No') {
            identified = 'Officer(s) identified to the public: <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">No</span>'
          } else {
            identified = 'Officer(s) identified to the public: <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">No</span>'
          }

          if (d.officer_injured === 'Unknown' || d.officer_injured === 'No') {
            officerHurt = 'Officer(s) injured: <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">No</span>'
          } else if (d.officer_injured === "Yes") {
            officerHurt = 'Officer(s) injured: <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">No</span>'
          } else if (d.officer_injured === "officer killed") {
            officerHurt = 'An officer was killed during the incident'
          } else { false; }

          if (d.use_of_force_justified === "Yes") {
            force = 'Use of force justified: <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">No</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Investigation ongoing</span>'
          } else if (d.use_of_force_justified === "Pending") {
            force = 'Use of force justified: <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">No</span> <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">Investigation ongoing</span>'
          } else {
            force = 'Use of force justified: <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Yes</span> <i class="fa fa-check-square-o" aria-hidden="true"></i> <span class="answers">No</span> <i class="fa fa-square-o" aria-hidden="true"></i> <span class="answers">Investigation ongoing</span>'
          }

          if (d.agencyCount > 1) {
            agency = "<p class='case-details'>*Agencies involved in the shooting: " + d.departments_involved;
            expo = "</p><p class='case-details expo'>* Involvement doesn't necessarily mean the decedent was shot and killed by that agency. The agency was at the scene of the crime.</p>"
          } else {
            agency = "<p class='case-details'>Agency involved in the shooting: " + d.departments_involved;
            expo = "</p>"
          }

          if  (d.CA_reviewed_by === "Pending") {
            review = 'the review is pending.'
          } else {
            review = 'reviewed by ' + d.CA_reviewed_by + '.'
          }

          if (d.charges_on_officer === "unknown" ) {
            charges = "Investigation outcome: Unknown"
          } else if (d.charges_on_officer === "pending") {
            charges = "Investigation outcome: Ongoing"
          } else if (d.charges_on_officer === "no charges") {
            charges = "Investigation outcome: Officer not charged."
          } else {
            charges = "Investigation outcome: Officer " + d.charges_on_officer + "."
          }

          if (d.img != "") {
            image = "<section class='img'><img src='//pilotonline.com/app/media/content/pilotonline/2016/04/police-shootings/database/" + d.img + "'/></section>"
          } else { image = "" }

          if (d.mental_health_issues === "Unknown" || d.mental_health_issues === "No") {
            mental = "No/unknown signs of mental health"
          } else {
            mental = "Known signs of mental health"
          }

       return "<section class=\"dec-img\"></section><section class=\"dec-name\"><section class='decedent-name'><p class='header'><span id='top-names'>" + d.name + "</span>, " + d.age + ", killed on " + format(new Date(d.date)) + " in " + d.location
       + "</p></section>" + image + "<p>" + d.incident
       + " <span class='media'> <a target='_blank' href='" + d.links + "'><span class='link'><i class='fa fa-external-link'></i> " + d.media + "</a></p></span>"
       + "<section class='decedent-information'><p class='decedent-details'>" + race +
       " </p><p class='decedent-details'> " + d.gender + " </p><p class='decedent-details'> " + age
       + " </p><p class='decedent-details'> " + mental
       + " </p><p class='decedent-details'> " + weapon
       + "</p>" + "</section><section class='case-information'><p class='case-details'>" + identified
       + " </p><p class='case-details'> " + officerHurt
       + " </p><p class='case-details'> " + force
       + " </p><p class='case-details'> " + charges
       + " </p><p class='case-details'>Shooting investigated by " + d.agency_reviewed_by + " and " + review
       + " </p>" + agency + expo + "</section></section>"
     });


  $('.dropdown-item').on("mouseover", function() {
    $(this).find('.key-totals').css("color" , "white")
  })

  $('.dropdown-item').on("mouseleave" , function() {
    $('.key-totals').css("color" , "#aaa")
  })

  var total = $('.decedent').length,
      visible = $('.decedent:visible').length;

    $('#visible').text(visible);
    $('#total-deaths').text(total);
}


function clicked(d) {
  var length = $('.decedent').length,
      name = $(".city-spots[title='" + d.properties.name + "']"),
      city = $(".database").find(".decedent[title='" + d.properties.name + "']"),
      number = d.properties.deaths;


  $('#search-criteria').val('');

  if (name = city && number != 0) {

    for (var j = 0, l = data_categories.length; j < l; j++) {
      $('#key-' + data_categories[j]).text($(".decedent[data-category*='" + data_categories[j] + "']").length)
    }

    $('.select').find('.selected').removeClass('selected').addClass('not-selected')
    $('.select').find('.no-results').removeClass('no-results')
    $('.decedent').removeClass("city-select").hide();
    $(city).addClass("city-select");
    $('#clear, .totals').hide();
    $('#city-clear').slideDown();
    $('.btn-popup-filter').remove();
    $('.inputs').removeClass('label-clicked').slideUp();
    $('.county-popup, .city-select').show();

    d3.select('#place-name').text(d.properties.name);
        d3.select('#place-count').html(function() {
      return '<span class="count-color">' + number + '</span> of the ' + length + ' people killed by police in Virginia'
      })


    if (ww < 475) {
    $('html, body' , window.parent.document).animate({scrollTop: ($('#place-name').offset().top )} , 500);
    return false;
  }


  }

  else {
    return false;
  }


}
function mouseovered(d) {

  var decedents = d.properties.decedents,
      number = d.properties.deaths,
      location = d.properties.name;

  d3.select('#area').html( function(d) {
      if (!number) {
        return "Click on an area to filter the shooting deaths by that area"
      }

      else if (number > 1) {
        return location + ", " + number + " people killed."
      }

      else if (number === 1) {
        return location + ", " + number + " person killed."
      }

      else { false }
  })
}

function zoom_by(factor){
    var scale = zoom.scale(),
        extent = zoom.scaleExtent(),
        translate = zoom.translate(),
        x = translate[0], y = translate[1],
        target_scale = scale * factor;

        $('.extent').removeClass("extent")

    if (target_scale > 2.1 || target_scale === extent[1]) {
      $('#zoom_in').addClass('extent')
      return false; }

    if (target_scale < .65) {
      $('#zoom_out').addClass('extent')
      return false;
    }

    else { $('#zoom_in').removeClass('extent') }
    var clamped_target_scale = Math.max(extent[0], Math.min(extent[1], target_scale));
    if (clamped_target_scale != target_scale){
        target_scale = clamped_target_scale;
        factor = target_scale / scale;
    }

    x = (x - center[0]) * factor + center[0];
    y = (y - center[1]) * factor + center[1];

    zoom.scale(target_scale)
        .translate([x,y]);
    zoomed();

}

function zoomed() {
  area.attr("transform", "translate(" + zoom.translate() + ")scale(" + zoom.scale() + ")");
  area.select(".county-border").style("stroke-width", 1.01 / zoom.scale() + "px")
  area.select(".state-border").style("stroke-width", 1.01 / zoom.scale() + "px")

}

$('#search-criteria').keyup(function(){

  var visible = $('.decedent:visible').length;
  $('#visible').text(visible);

  $('.decedent, .county-popup').hide();
  $('.inputs').removeClass('label-clicked').slideUp();
  $('#clear, #city-clear').hide();
  var txt = $('#search-criteria').val();
  $('.decedent').each(function(){
     if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1){
        $(this).show();
     }
  });
});

$('#search-criteria').autocomplete({ source: decedent_names })
$('.ui-autocomplete').css("position" , "absolute")
$('#city-clear, #place-name, #place-count').hide();

$('#city-clear').click(function(){
  $('.decedent').hide().removeClass("city-select").show();
  $('#city-clear').hide();
  $('.totals').show();
  $('#place-name, #place-count').hide();
})

