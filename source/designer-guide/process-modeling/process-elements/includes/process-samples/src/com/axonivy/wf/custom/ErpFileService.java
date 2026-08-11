package com.axonivy.wf.custom;

import ch.ivyteam.ivy.scripting.objects.File;

public class ErpFileService {

  private static final ErpFileService INSTANCE = new ErpFileService();

  public static ErpFileService instance() {
    return INSTANCE;
  }
  public void reportStats(File statistics) {
  }

}
