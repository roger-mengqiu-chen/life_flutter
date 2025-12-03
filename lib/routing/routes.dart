abstract final class Routes {
  static const home = '/';
  static const auth = '/auth';
  static const transactions = '/transactions';
  static String transactionWithId(int id) => '/transactions/$id';
  static const investments = '/investments';
  static const utilities = '/utilities';
  static String utilitiesWithId(int id) => '/utilities/$id';
  static const categories = '/categories';
  static String categoryWithId(int id) => '/categories/$id';
  static const report = '/reports';
}