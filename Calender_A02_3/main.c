///////////////////////////////////////////////////////////////////////////// 
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with: 
 
// no one 
//  
// Name: Ekansh Lalhyani 
// login ID: elakhyan - 20945086 
///////////////////////////////////////////////////////////////////////////// 

#include "cs136.h"

/////////////////////////////////////////////////////////////////////////////
// PROVIDED FUNCTION and CONSTANTS (DO NOT CHANGE)

// print_header(year, month) prints the calendar "header" 
//   for the given year/month
// notes: if month is invalid, no month line is printed
//        header is aligned for 4-digit years
// effects: produces output
void print_header(const int year, const int month) {
  if (month == 1) {
    printf("====January %d====\n", year);
  } else if (month == 2) {
    printf("===February %d====\n", year);
  } else if (month == 3) {
    printf("=====March %d=====\n", year);
  } else if (month == 4) {
    printf("=====April %d=====\n", year);
  } else if (month == 5) {
    printf("======May %d======\n", year);
  } else if (month == 6) {
    printf("=====June %d======\n", year);
  } else if (month == 7) {
    printf("=====July %d======\n", year);
  }else if (month == 8) {
    printf("====August %d=====\n", year);
  } else if (month == 9) {
    printf("===September %d===\n", year);
  } else if (month == 10) {
    printf("====October %d====\n", year);
  } else if (month == 11) {
    printf("===November %d====\n", year);
  } else if (month == 12) {
    printf("===December %d====\n", year);
  }
  printf("Su Mo Tu We Th Fr Sa\n");
}

// you may use these constants in your code if you wish
// it is not a requirement, but it is strongly recommended
// you may not change their values

const int SUNDAY = 0;
const int base_year = 1589;
const int base_year_jan_1 = SUNDAY;
const int max_year = 2999;
/////////////////////////////////////////////////////////////////////////////

// is_leap(year) produces true if the year is leap and false if not.
bool is_leap(int year) {
  if ((year % 400) == 0) { 
    return true;
  } else if ((year % 100) == 0) {
    return false;
  } else if ((year % 4) == 0) {
    return true;
  } else {
    return false;
  }
}

// month_days(year, int) produces the number of days in the given month of the
// given year.
int month_days(int year, int month) {
  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  } else if (month == 2 && is_leap(year)) {
    return 29;
  } else if (month == 2) {
    return 28;
  } else {
    return 31;
  }
}

// valid_dates(year, month, day) produces true if the date for the given day,
// month and year is a valid one and false otherwise.
bool valid_date(int year, int month, int day) {
  if (year > max_year || year < base_year) {
  return false;
  } else if (month > 12 || month < 1) {
    return false;
  } else if (day > (month_days(year, month)) || day < 1) {
    return false;
  } else {
    return true;
  }
}

// day_of_the_week(year, month, day) produces the day(0-6) for the
// given date (day, month, year)
// requires: the date is a valid date.
int day_of_the_week(int year, int month, int day) {
  int loop_year = base_year;
  int week_day = SUNDAY;
  while (year >= loop_year) {
    int loop_month = 1;
    while ((12 >= loop_month) && (year != loop_year || month != loop_month)) {
      week_day = (week_day + month_days(loop_year, loop_month)) % 7;
      ++loop_month;
    }
    ++loop_year;
  } 
  return (week_day + day - 1) % 7;
}

// print_calendar(year, month) prints calender of the given month
// of the given year. 
// requires: valid year and month.
// effects: prints to the screen.
void print_calendar(int year, int month) {
  print_header(year, month);
  const int max_day = month_days(year, month);
  const int first_day = day_of_the_week(year, month, 1);
  int calender_day = 1 - first_day;
  while (calender_day <= max_day) {
    if (calender_day <= 0) {
      printf("   ");
      ++calender_day;
    } else if (day_of_the_week(year, month, calender_day) == 6) { 
      printf("%2d\n", calender_day);
      ++calender_day;
    } else if (calender_day == max_day) {
      printf("%2d\n", calender_day);
      ++calender_day;
    } else {
      printf("%2d ", calender_day);
      ++calender_day;
    }
  }
}


void assertion_tests(void) {
  // Due date is a valid date and a Thursday 
  assert(valid_date(2021, 1, 28));
  assert(day_of_the_week(2021, 1, 28) == 4);
  
  // Add your own assertion-based tests below
  assert(is_leap(400));
  assert(is_leap(700) == 0); 
  assert(is_leap(804));
  assert(month_days(1, 1) == 31);
  assert(month_days(1, 2) == 28);
  assert(month_days(400, 2) == 29);
  assert(month_days(800, 4) == 30);
  assert(day_of_the_week(2022, 5, 26) == 4);
  assert(day_of_the_week(2020, 2, 29) == 6);
  assert(day_of_the_week(2022, 3, 1) == 2);
  assert(day_of_the_week(2022, 12, 31) == 6);
  assert(day_of_the_week(2022, 5, 29) == 0);
}

///////////////////////////////////////////////////////
// You do not need to modify the rest of the program //
///////////////////////////////////////////////////////

int main(void) {
  assertion_tests();
  while (1) {
    int year = read_int();
    int month = read_int();
    if (month == READ_INT_FAIL) {
      break;
    }
    print_calendar(year, month);
  }
}
