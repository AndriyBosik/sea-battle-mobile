enum StorageBox {
  appContext
}

extension BoxName on StorageBox {
  String name() {
    switch (this) {
      case StorageBox.appContext:
        return "app_context";
    }
  }
}