import 'package:flutter/foundation.dart';

const behanceUrl = 'https://www.behance.net/iqonicdesign/';
//endregion

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';

/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;
const textSizeXXLarge = 35.0;

const applicationMaxWidth = 500.0;

const isDarkModeOnPref = 'isDarkModeOnPref';
const dateFormat = 'MMM dd, yyyy';

const BaseUrl = 'https://assets.iqonic.design/old-themeforest-images/prokit';

const defaultImage = "https://web.lofaz.com/static/media/logo.e1d05a2b.png";

/// shared preference keys
const authTokenPref = 'auth_token_pref';
const catalogCreated = 'catalog_created';
const productCreated = 'product_created';
const authSessionPref = 'auth_session_pref';
const ipLocationInfoPref = 'ip_location_info_pref';

enum ProductLabel {
  NEW("new"),
  HOT("hot"),
  NONE("none");

  const ProductLabel(this.value);

  final String value;
}

enum OrderTabStates { all, pending, accepted, shipped, delivered, cancelled }

const String mainDomain = "lofaz.com";

const String apiEndpoint =
    kDebugMode ? "https://betabackend.lofaz.in" : "https://api.lofaz.com";

const String mainUrl = "https://$mainDomain";
