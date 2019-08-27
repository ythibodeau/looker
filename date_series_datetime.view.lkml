view: date_series_datetime {

  derived_table: {
    create_process: {
      sql_step:
        CREATE TABLE ${SQL_TABLE_NAME} (
  id int(11) NOT NULL AUTO_INCREMENT,
  date_x datetime NOT NULL,
  PRIMARY KEY (id)
)
      ;;

      sql_step:
      INSERT INTO ${SQL_TABLE_NAME} (id, date_x)
   VALUES
    (1,'2010-01-01 05:00:00'),
    (2,'2010-04-01 04:00:00'),
    (3,'2010-07-01 04:00:00'),
    (4,'2010-10-01 04:00:00'),
    (5,'2011-01-01 05:00:00'),
    (6,'2011-04-01 04:00:00'),
    (7,'2011-07-01 04:00:00'),
    (8,'2011-10-01 04:00:00'),
    (9,'2012-01-01 05:00:00'),
    (10,'2012-04-01 04:00:00'),
    (11,'2012-07-01 04:00:00'),
    (12,'2012-10-01 04:00:00'),
    (13,'2013-01-01 05:00:00'),
    (14,'2013-04-01 04:00:00'),
    (15,'2013-07-01 04:00:00'),
    (16,'2013-10-01 04:00:00'),
    (17,'2014-01-01 05:00:00'),
    (18,'2014-04-01 04:00:00'),
    (19,'2014-07-01 04:00:00'),
    (20,'2014-10-01 04:00:00'),
    (21,'2015-01-01 05:00:00'),
    (22,'2015-04-01 04:00:00'),
    (23,'2015-07-01 04:00:00'),
    (24,'2015-10-01 04:00:00'),
    (25,'2016-01-01 05:00:00'),
    (26,'2016-04-01 04:00:00'),
    (27,'2016-07-01 04:00:00'),
    (28,'2016-10-01 04:00:00'),
    (29,'2017-01-01 05:00:00'),
    (30,'2017-04-01 04:00:00'),
    (31,'2017-07-01 04:00:00'),
    (32,'2017-10-01 04:00:00'),
    (33,'2018-01-01 05:00:00'),
    (34,'2018-04-01 04:00:00'),
    (35,'2018-07-01 04:00:00'),
    (36,'2018-10-01 04:00:00'),
    (37,'2019-01-01 05:00:00'),
    (38,'2019-04-01 04:00:00'),
    (39,'2019-07-01 04:00:00'),
    (40,'2019-10-01 04:00:00');
      ;;
    }
  }

  measure: count {
    type: count
  }

  dimension: id {
    type: number
    primary_key: yes
    label: "ID"
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_x {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Quarter Start Date"
    sql: ${TABLE}.date_x ;;
  }
}
