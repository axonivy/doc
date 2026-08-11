package com.axonivy.wf.custom;


import java.net.URI;
import java.util.List;

import ch.ivyteam.ivy.process.program.activity.AbortableExecution;
import ch.ivyteam.ivy.process.program.activity.ProgramExecutor;
import ch.ivyteam.ivy.process.program.element.ProgramIconDecorator;
import ch.ivyteam.ivy.process.program.ui.ProgramEditorUi;
import ch.ivyteam.ivy.process.program.ui.ProgramUiBuilder;
import ch.ivyteam.ivy.process.program.ui.select.SelectItem;
import ch.ivyteam.ivy.scripting.objects.File;
import ch.ivyteam.log.Logger;

public class ErpLoader implements ProgramExecutor, ProgramEditorUi, ProgramIconDecorator  {

  private static final Logger LOGGER = Logger.getLogger(ErpLoader.class);

  @Override
  public AbortableExecution newExecution() {
    return context -> {
      String path = context.config().get(Config.PATH);
      var statistics = context.script()
        .executeExpression(path, File.class)
        .filter(File::exists);
      if (!statistics.isEmpty()) {
        LOGGER.warn("Can't resolve statistics file from "+path);
        return;
      }
      ErpFileService.instance().reportStats(statistics.get());
    };
  }
  
  @Override
  public void editor(ProgramUiBuilder ui) {
    ui.scriptField(Config.PATH)
      .requireType(File.class)
      .label("The CSV statistic to report to Acme.ERP:")
      .create();

    ui.multiSelect(Config.TYPES)
      .label("File extensions:")
      .items(List.of(
          SelectItem.of("CSV", "CSV", "🪪️", "stable plain text"),
          SelectItem.of("XLS"),
          SelectItem.of("XLSX")))
      .create();
  }

  private static interface Config {
    String PATH = "path";
    String TYPES = "types";
  }
  
  @Override
  public URI icon() {
    // Program's with a custom icon, will be shown in the "Extension" group of the
    // process-editor toolbar. 
    // This increases the discoverability and ease of insertion for users.
    return URI.create("res:/webContent/logo/erp.png");
  }
}
