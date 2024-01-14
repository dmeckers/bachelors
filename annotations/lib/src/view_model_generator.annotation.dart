class ViewModelAnnotation {
  final bool withHook;
  final bool withStateNotifier;

  const ViewModelAnnotation({this.withHook = false, this.withStateNotifier = false});
}

const jvmodel = ViewModelAnnotation();
