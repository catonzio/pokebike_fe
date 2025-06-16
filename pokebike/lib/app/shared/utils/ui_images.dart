enum UIImageKey {
  // classifica('classifica', 'assets/images/classifica.jpg'),
  drawerBg('drawer_bg', 'assets/images/drawer_bg.png'),
  loginBg('login_bg', 'assets/images/login_bg.png'),
  /*  partecipaAlTorneo(
      'partecipa_al_torneo', 'assets/images/partecipa_al_torneo.jpg'), */
  registerBg('register_bg', 'assets/images/register_bg.png'),
  presentation1(
      'presentation_1', 'assets/images/presentation/presentation_1.png'),
  presentation2(
      'presentation_2', 'assets/images/presentation/presentation_2.png'),
  presentation3(
      'presentation_3', 'assets/images/presentation/presentation_3.png'),
  splash('splash', 'assets/images/splash.png');

  final String key;
  final String fallbackAsset;
  const UIImageKey(this.key, this.fallbackAsset);
}
