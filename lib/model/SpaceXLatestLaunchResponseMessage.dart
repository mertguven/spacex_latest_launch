class SpaceXLatestLaunchResponseMessage {
  Fairings fairings;
  Links links;
  Null staticFireDateUtc;
  Null staticFireDateUnix;
  bool tbd;
  bool net;
  Null window;
  String rocket;
  bool success;
  String details;
  List<String> ships;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  String launchLibraryId;
  int flightNumber;
  String name;
  String dateUtc;
  int dateUnix;
  String dateLocal;
  String datePrecision;
  bool upcoming;
  List<Cores> cores;
  String id;

  SpaceXLatestLaunchResponseMessage(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.tbd,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.details,
      this.ships,
      this.payloads,
      this.launchpad,
      this.autoUpdate,
      this.launchLibraryId,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.id});

  SpaceXLatestLaunchResponseMessage.fromJson(Map<String, dynamic> json) {
    fairings = json['fairings'] != null
        ? new Fairings.fromJson(json['fairings'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    tbd = json['tbd'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    details = json['details'];
    ships = json['ships'].cast<String>();
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    autoUpdate = json['auto_update'];
    launchLibraryId = json['launch_library_id'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = new List<Cores>();
      json['cores'].forEach((v) {
        cores.add(new Cores.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fairings != null) {
      data['fairings'] = this.fairings.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['static_fire_date_utc'] = this.staticFireDateUtc;
    data['static_fire_date_unix'] = this.staticFireDateUnix;
    data['tbd'] = this.tbd;
    data['net'] = this.net;
    data['window'] = this.window;
    data['rocket'] = this.rocket;
    data['success'] = this.success;
    data['details'] = this.details;
    data['ships'] = this.ships;
    data['payloads'] = this.payloads;
    data['launchpad'] = this.launchpad;
    data['auto_update'] = this.autoUpdate;
    data['launch_library_id'] = this.launchLibraryId;
    data['flight_number'] = this.flightNumber;
    data['name'] = this.name;
    data['date_utc'] = this.dateUtc;
    data['date_unix'] = this.dateUnix;
    data['date_local'] = this.dateLocal;
    data['date_precision'] = this.datePrecision;
    data['upcoming'] = this.upcoming;
    if (this.cores != null) {
      data['cores'] = this.cores.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Fairings {
  Null reused;
  bool recoveryAttempt;
  bool recovered;
  List<String> ships;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ships});

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ships = json['ships'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ships'] = this.ships;
    return data;
  }
}

class Links {
  Patch patch;
  Reddit reddit;
  Null presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  Links(
      {this.patch,
      this.reddit,
      this.presskit,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? new Patch.fromJson(json['patch']) : null;
    reddit =
        json['reddit'] != null ? new Reddit.fromJson(json['reddit']) : null;
    presskit = json['presskit'];
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patch != null) {
      data['patch'] = this.patch.toJson();
    }
    if (this.reddit != null) {
      data['reddit'] = this.reddit.toJson();
    }
    data['presskit'] = this.presskit;
    data['webcast'] = this.webcast;
    data['youtube_id'] = this.youtubeId;
    data['article'] = this.article;
    data['wikipedia'] = this.wikipedia;
    return data;
  }
}

class Patch {
  String small;
  String large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}

class Reddit {
  String campaign;
  String launch;
  Null media;
  String recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  Reddit.fromJson(Map<String, dynamic> json) {
    campaign = json['campaign'];
    launch = json['launch'];
    media = json['media'];
    recovery = json['recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaign'] = this.campaign;
    data['launch'] = this.launch;
    data['media'] = this.media;
    data['recovery'] = this.recovery;
    return data;
  }
}

class Cores {
  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  Cores(
      {this.core,
      this.flight,
      this.gridfins,
      this.legs,
      this.reused,
      this.landingAttempt,
      this.landingSuccess,
      this.landingType,
      this.landpad});

  Cores.fromJson(Map<String, dynamic> json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = json['landing_success'];
    landingType = json['landing_type'];
    landpad = json['landpad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core'] = this.core;
    data['flight'] = this.flight;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['landing_attempt'] = this.landingAttempt;
    data['landing_success'] = this.landingSuccess;
    data['landing_type'] = this.landingType;
    data['landpad'] = this.landpad;
    return data;
  }
}
