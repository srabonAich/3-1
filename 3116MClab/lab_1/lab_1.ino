// int buttonPin = 4;   // GPIO2 connected to push button
// int state = 0;       // variable to store button state

// void setup() {
//   Serial.begin(9600);          // start serial monitor
//   pinMode(buttonPin, INPUT);   // set pin as input
// }

// void loop() {
//   state = digitalRead(buttonPin);  // read the button
//   if (state == HIGH) {
//     Serial.println("Button PRESSED");
//   } else {
//     Serial.println("Button NOT pressed");
//   }
//   delay(200); // small delay to avoid flooding Serial
// }





// led with previous code
// const int buttonPin = 4;   // your button is on GPIO4
// const int ledPin    = 5;   // recommended: use GPIO5 (safe). Change to 8 at your own risk.

// void setup() {
//   Serial.begin(9600);
//   pinMode(buttonPin, INPUT_PULLDOWN); // use internal pull-down
//   pinMode(ledPin, OUTPUT);
//   digitalWrite(ledPin, LOW); // ensure LED starts OFF
// }

// void loop() {
//   int state = digitalRead(buttonPin); // 0 when NOT pressed, 1 when pressed (with pull-down)
//   if (state == HIGH) {
//     digitalWrite(ledPin, HIGH); // LED ON while pressed
//     Serial.println("Button PRESSED -> LED ON");
//   } else {
//     digitalWrite(ledPin, LOW);  // LED OFF when not pressed
//     Serial.println("Button NOT pressed -> LED OFF");
//   }
//   delay(100); // small delay to avoid spamming Serial
// }





// //toggle like a switch
// const int buttonPin = 2;   // button on GPIO4
// const int ledPin    = 5;   // LED on GPIO5 (safe)

// int lastButtonState = LOW; // previous reading of button
// int ledState = LOW;        // track current LED state

// void setup() {
//   Serial.begin(9600);
//   pinMode(buttonPin, INPUT_PULLDOWN); // internal pull-down
//   pinMode(ledPin, OUTPUT);
//   digitalWrite(ledPin, ledState);
// }

// void loop() {
//   int buttonState = digitalRead(buttonPin);

//   // Detect rising edge: button goes from LOW to HIGH
//   if (buttonState == HIGH && lastButtonState == LOW) {
//     ledState = !ledState; // toggle LED state
//     digitalWrite(ledPin, ledState);
//     Serial.println(ledState ? "LED ON (toggled)" : "LED OFF (toggled)");
//     delay(50); // debounce delay
//   }

//   lastButtonState = buttonState; // update for next loop
// }





// int buttonPin = 4;
// int ledPin = 5;
// int state = 0;

// void setup() {
//   Serial.begin(9600);
//   pinMode(buttonPin, INPUT);
//   pinMode(ledPin, OUTPUT);
// }

// void loop() {
//   state = digitalRead(buttonPin);

//   if (state == HIGH) {   // button pressed
//     Serial.println("Button Pressed");
//     digitalWrite(ledPin, HIGH);
//     delay(5000);  // Keep LED ON for 5 seconds
//     digitalWrite(ledPin, LOW);
//   }
// }







//lcd display
// include the library code:
#include <LiquidCrystal.h>
 
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(19, 23, 18, 17, 16, 15);
 
void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("Srabon");
}
 
void loop() {
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(15);
}