class PagingData<T> {
  const PagingData(this.page, this.totalPage, this.data);

  final int page;
  final int totalPage;
  final List<T> data;

  int? get nextPage {
    return page < totalPage ? page + 1 : null;
  }

  int? get previousPage {
    return page > 1 ? page - 1 : null;
  }

  bool get hasNext {
    return nextPage != null;
  }

  bool get hasPrevious {
    return previousPage != null;
  }
}
