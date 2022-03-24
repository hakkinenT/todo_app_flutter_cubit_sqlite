class ConvertBool {
  static int convertBoolToInt(bool value) {
    int intValue = value ? 1 : 0;
    return intValue;
  }

  static bool convertIntToBool(int value) {
    bool boolValue = value == 1 ? true : false;
    return boolValue;
  }
}
