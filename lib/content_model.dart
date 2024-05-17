class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Welcome',
      image: 'images/g1.svg',
      discription: "Never lose track of your mail again "
          "with our letter count feature. Stay on "
          "top of your incoming mail, and enjoy "
          "a streamlined mailbox experience."),
  UnbordingContent(
      title: 'Stay informed',
      image: 'images/g2.svg',
      discription: "Real-time notifications give you "
          "peace of mind and convenience. "
          "Stay up-to-date with your mails and "
          "packages, and be instantly alerted "
          "when new items arrive, all at your "
          "fingertips"),
  UnbordingContent(
      title: 'Mailbox\nManagement',
      image: 'images/g3.svg',
      discription: "Let us make managing your "
          "mailbox effortless. Sign up today "
          "and take control of your mail"),
];
