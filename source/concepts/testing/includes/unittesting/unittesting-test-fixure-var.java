@Test
void products_globalVariable(AppFixture fixture)
{
  /* The AppFixture can manipulate global variables. */
  fixture.var("table", "799.95");
  
  assertThat(OrderUtil.getProducts()).hasSize(2);
  Product table = OrderUtil.getProducts().get(0);
  
  /* Normally the price of a table would be 500.- */
  assertThat(table.getSinglePrice()).isEqualTo(799.95);
}
