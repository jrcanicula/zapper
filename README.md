# Zapper Assessment

## Overview
This repository contains the solutions for the Zapper Assessment.

- **DatabaseDesign.sql**: The answer for Question #1, defining data structures to track transactions between customers and merchants.
- **UserSettingsZapper**: The solution for Question 2.1, which checks if a specific feature is enabled in a user's settings.
- **UserSettingStorageZapper**: The solution for Question 2.2, which provides functions to read and write user settings to a file in the least amount of space.

## Questions

### Question 1 - Database Design
At Zapper, we facilitate transactions between our customers and merchants. Write SQL to define data structures that can help us track these transactions.

### Question 2 - User Settings
A user profile has 8 boolean settings that determine their functionality:
1. SMS Notifications Enabled
2. Push Notifications Enabled
3. Bio-metrics Enabled
4. Camera Enabled
5. Location Enabled
6. NFC Enabled
7. Vouchers Enabled
8. Loyalty Enabled

#### Question 2.1 - Checking if a Feature is Enabled
Given a user's settings represented as a string where each position represents a different setting, write a function to determine if a user has a specific feature enabled.

##### Test Cases
- Input: `settings = 00000000`, `setting = 7`
  - Output: `false`
- Input: `settings = 00000010`, `setting = 7`
  - Output: `true`
- Input: `settings = 11111111`, `setting = 4`
  - Output: `true`

#### Question 2.2 - Storing User Settings
Write functions to read and write the settings to a file in the least amount of space.