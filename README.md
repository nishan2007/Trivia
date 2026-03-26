# Project 5 - Trivia Challenge

Submitted by: Nishan Narain

Trivia Challenge App is an iOS app that allows users to customize and play a trivia quiz using questions fetched from the Open Trivia Database API. Users can choose the number of questions, category, difficulty, and type, and view questions in either a list or card-style interface. The app tracks selected answers and displays the final score after submission.
Time spent: 5-7 hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App launches to an Options screen where user can modify the types of questions presented when the game starts. Users should be able to choose:
  - [x] Number of questions
  - [x] Category of questions
  - [x] Difficulty of questions
  - [x] Type of questions (Multiple Choice or True False)
- [x] User can tap a button to start trivia game, this presents questions and answers in a List or Card view.
  - Hint: For Card view visit your FlashCard app. List view is an equivalent to UITableView in UIKit. Much easier to use!
- [x] Selected choices are marked as user taps their choice (but answered is not presented yet!)
- [x] User can submit choices and is presented with a score on trivia game
 
The following **optional** features are implemented:

- [ ] User has answer marked as correct or incorrect after submitting choices (alongside their score).
- [ ] Implement a timer that puts pressure on the user! Choose any time that works and auto submit choices after the timer expires. 

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

https://www.loom.com/share/d394bbf403b948b3adfe3244e5b9ddad
## Notes

Describe any challenges encountered while building the app.
One of the main challenges encountered was handling the HTML-encoded text returned from the API (such as special characters). This was resolved by implementing a custom HTML decoder. Another challenge was managing state and ensuring that selected answers were properly tracked and displayed without causing UI inconsistencies.

## License

    Copyright [2016] [Nishan Narain]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
