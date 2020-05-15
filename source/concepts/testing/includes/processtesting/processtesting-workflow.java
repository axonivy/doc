@Test
void workflow(BpmClient bpmClient, @Named("ldv") IUser user)
{
  BpmElement prepareShipmentStart = INVOICE_PROCESS.elementName("prepareShipment.ivp");
  
  ExecutionResult result = bpmClient
          .start().process(prepareShipmentStart)
          .as().user(user)
          .execute();
  
  /* Asserting case and task states */
  assertThat(result.workflow().activeCase().getState()).isEqualTo(CaseState.RUNNING);
  assertThat(result.workflow().executedTask().getState()).isEqualTo(TaskState.DONE);
  
  /* Asserting if any active tasks are present */
  assertThat(result.workflow().anyActiveTask()).isPresent();
  assertThat(result.workflow().activeTasks()).hasSize(1);
  assertThat(result.workflow().activeTask().name("prepare shipment")).isPresent();
  assertThat(result.workflow().activeTask().name().startsWith("prepare")).isPresent();
  
  /* Asserting the activator */
  assertThat(result.workflow().activeTask().activatorUser("ldv")).isPresent();
  assertThat(result.workflow().activeTask().activator(user)).isPresent();
  
  /* Asserting the session user */
  assertThat(result.workflow().session().getSessionUserName()).isEqualTo("ldv");
}