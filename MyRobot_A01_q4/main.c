#include "cs136.h"

int robot_direction = 0;
int robot_x_coordinate = 0;
int robot_y_coordinate = 0;
int beacon_x_coordinate = 0;
int beacon_y_coordinate = 0;
int beacon_place = 0;
int bb_ll_x_coordinate = 0;
int bb_ll_y_coordinate = 0;
int bb_ur_x_coordinate = 0;
int bb_ur_y_coordinate = 0;
int distance_from_beacon = 0;

// robot_forward(distance) moves the robot forward for the given distance.
// requires: distance > 0
// effects: may print to the screen or mutate variables.
void robot_forward(int distance) {
  if (distance < 0) {
    printf("ERROR: invalid distance\n");
  } else if ( robot_direction % 4 == 0) {
    robot_y_coordinate += 1;
    if (bb_ur_y_coordinate < robot_y_coordinate) {
      bb_ur_y_coordinate = robot_y_coordinate;
    }
  } else if (robot_direction % 4 == 1) {
    robot_x_coordinate += 1;
    if (bb_ur_x_coordinate < robot_x_coordinate) {
      bb_ur_x_coordinate = robot_x_coordinate;
    }
  } else if (robot_direction % 4 == -3) {
    robot_x_coordinate += 1;
    if (bb_ur_x_coordinate > robot_x_coordinate) {
      bb_ur_x_coordinate = robot_x_coordinate;
    }
  } else if (abs(robot_direction) % 4 == 2) {
    robot_y_coordinate -= 1;
    if ( bb_ll_y_coordinate < robot_y_coordinate) {
      bb_ll_y_coordinate = robot_y_coordinate;
    }
  } else {
    robot_x_coordinate -= 1;
    if (robot_x_coordinate < bb_ll_x_coordinate) {
      bb_ll_x_coordinate = robot_x_coordinate;
    }
  }
}

// robot_left changes the robot direction 90 degrees to the left.
// effects: mutates robot_direction
void robot_left(void) {
  robot_direction -= 1;
}

// robot_right changes the robot direction 90 degrees to the right.
// effects: mutates robot_direction
void robot_right(void) {
  robot_direction += 1;
}

// robot_place places the beacon at the current position of the robot\
// , if possible.
// effects: may print to screen or mutate variable.
void robot_place(void) {
  if (beacon_place == 1) {
    printf("ERROR: beacon already placed\n");
  } else {
    beacon_place += 1;
    beacon_x_coordinate = robot_x_coordinate;
    beacon_y_coordinate = robot_y_coordinate;
  }
}

// robot_pickup pickes up the beacon at the current position if possible.
// effects: may print to the screen or mutate variables.
void robot_pickup(void) {
  if (beacon_place == 0) {
    printf("ERROR: beacon is not placed or not at this location\n");
  } else if (beacon_x_coordinate != robot_x_coordinate) {
    printf("ERROR: beacon is not placed or not at this location\n");
  } else if (beacon_y_coordinate != robot_y_coordinate) {
    printf("ERROR: beacon is not placed or not at this location\n");
  } else {
    beacon_place -= 1;
  }
}
  
// robot_status prints out the current status of the robot.
// effects: prints to the screen.
void robot_status(void) {
  printf("robot is at (%d,%d) and is facing ", robot_x_coordinate\
         , robot_y_coordinate);
  if ( robot_direction % 4 == 0) {
    printf("north\n");
  } else if (abs(robot_direction) % 4 == 2) { 
    printf("south\n");
  } else if (robot_direction % 4 == 1) {
    printf("east\n");
  } else if (robot_direction % 4 == -3) {
    printf("east\n");
  } else {
    printf("west\n");
  } if (beacon_place == 0) {
    distance_from_beacon = 0;
  } else {
    int x_dist = abs(beacon_x_coordinate - robot_x_coordinate);
    int y_dist = abs(beacon_y_coordinate - robot_y_coordinate);
    distance_from_beacon = x_dist + y_dist;
  }
  printf("the distance to the beacon is: %d\n", distance_from_beacon);
  printf("the bounding box is (%d,%d)-(%d,%d)\n", bb_ll_x_coordinate,\
         bb_ll_y_coordinate, bb_ur_x_coordinate, bb_ur_y_coordinate);
}

// robot_reset resets the robot to starting conditions.
// effects: mutates variables.
void robot_reset(void) {
  robot_direction = 0;
  robot_x_coordinate = 0;
  robot_y_coordinate = 0;
  beacon_x_coordinate = 0;
  beacon_y_coordinate = 0;
  beacon_place = 0;
  bb_ll_x_coordinate = 0;
  bb_ll_y_coordinate = 0;
  bb_ur_x_coordinate = 0;
  bb_ur_y_coordinate = 0;
  distance_from_beacon = 0;
}


///////////////////////////////////////////////////
// YOU MAY NOT MODIFY THE REMAINDER OF THIS FILE //
///////////////////////////////////////////////////

int main(void) {
  // yes, we're using a loop on A1 but you can't until A2  
  while (true) {
    int cmd = read_symbol();
    if (cmd == lookup_symbol("fwd")) {
      int distance = read_int();
      if (distance == READ_INT_FAIL) {
        break;
      }
      robot_forward(distance);
    } else if (cmd == lookup_symbol("left")) {
      robot_left();
    } else if (cmd == lookup_symbol("right")) {
      robot_right();
    } else if (cmd == lookup_symbol("place")) {
      robot_place();
    } else if (cmd == lookup_symbol("pickup")) {
      robot_pickup();
    } else if (cmd == lookup_symbol("status")) {
      robot_status();
    } else if (cmd == lookup_symbol("reset")) {
      robot_reset();
    } else {
      break;
    }
  }
}
