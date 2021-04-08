class Mail {
  final String useravatar;
  final String username;
  final String subject;
  final String body;
  final bool starred;
  final String timeago;
  final bool seen;
  final bool file;
  final String filename;

  Mail({
    this.useravatar,
    this.username,
    this.subject,
    this.body,
    this.starred,
    this.timeago,
    this.seen,
    this.file,
    this.filename
  });
}