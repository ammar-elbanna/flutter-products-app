class ProductViewModel {
  int id;
  String name;
  int count;

  // AccountEntity accountEntity;

  ProductViewModel({
    this.id,
    this.name,
    this.count,
  });

  // ProductViewModel.fromEntity(AccountEntity accountEntity) {
  //   this.accountEntity = accountEntity;
  //   this.name = accountEntity.name;
  //   this.count = accountEntity.count;

  //   if (accountEntity.id != null) {
  //     this.id = accountEntity.id;
  //   }
  // }

  ProductViewModel.fromViewModel(ProductViewModel accountVM) {
    this.name = accountVM.name;
    this.count = accountVM.count;
    if (accountVM.id != null) {
      this.id = accountVM.id;
    }
  }

  reset() {
    this.id = null;
    this.name = '';
    this.count = 0;
  }
}
