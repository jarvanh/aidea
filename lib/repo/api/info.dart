import 'package:askaide/repo/api/model.dart';

/// 服务器支持的能力信息
class Capabilities {
  /// 是否支持 Apple Pay
  final bool applePayEnabled;

  /// 是否支持 Stripe
  final bool stripeEnabled;

  /// 是否支持微信登录
  final bool wechatSigninEnabled;

  /// 是否支持微信支付
  final bool wechatPayEnabled;

  /// 是否支持其它
  final bool otherPayEnabled;

  /// 是否支持翻译
  final bool translateEnabled;

  /// 是否支持邮箱
  final bool mailEnabled;

  /// 是否支持 OpenAI
  final bool openaiEnabled;

  /// 首页显示的模型信息
  final List<HomeModelV2> homeModels;

  /// 是否显示首页模型描述
  final bool showHomeModelDescription;

  /// 首页路由
  final String homeRoute;

  /// 是否支持 Websocket
  final bool supportWebsocket;

  /// 是否支持 API Keys 功能
  final bool supportAPIKeys;

  /// 是否显示绘玩
  final bool disableGallery;

  /// 是否支持创作岛
  final bool disableCreationIsland;

  /// 是否禁用数字人
  final bool disableDigitalHuman;

  /// 是否禁用聊天
  final bool disableChat;

  /// 服务状态页
  final String serviceStatusPage;

  /// 是否支持语音转文字
  final bool enableVoiceToText;

  /// 是否支持文字转语音
  final bool enableTextToVoice;

  Capabilities({
    required this.applePayEnabled,
    required this.otherPayEnabled,
    required this.translateEnabled,
    required this.mailEnabled,
    required this.openaiEnabled,
    required this.homeModels,
    this.homeRoute = '/',
    this.showHomeModelDescription = true,
    this.supportWebsocket = false,
    this.supportAPIKeys = false,
    this.disableGallery = false,
    this.disableCreationIsland = false,
    this.disableDigitalHuman = false,
    this.disableChat = false,
    this.serviceStatusPage = '',
    this.wechatSigninEnabled = false,
    this.stripeEnabled = false,
    this.wechatPayEnabled = false,
    this.enableVoiceToText = false,
    this.enableTextToVoice = false,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) {
    return Capabilities(
      wechatSigninEnabled: json['wechat_signin_enabled'] ?? false,
      applePayEnabled: json['apple_pay_enabled'] ?? false,
      stripeEnabled: json['stripe_enabled'] ?? false,
      otherPayEnabled: json['other_pay_enabled'] ?? false,
      translateEnabled: json['translate_enabled'] ?? false,
      mailEnabled: json['mail_enabled'] ?? false,
      openaiEnabled: json['openai_enabled'] ?? false,
      homeModels: ((json['home_models_v2'] ?? []) as List<dynamic>).map((e) => HomeModelV2.fromJson(e)).toList(),
      // homeRoute: json['home_route'] ?? '/',
      homeRoute: '/',
      showHomeModelDescription: json['show_home_model_description'] ?? true,
      supportWebsocket: json['support_websocket'] ?? false,
      supportAPIKeys: json['support_api_keys'] ?? false,
      disableGallery: json['disable_gallery'] ?? false,
      disableCreationIsland: json['disable_creation_island'] ?? false,
      disableDigitalHuman: json['disable_digital_human'] ?? false,
      disableChat: json['disable_chat'] ?? false,
      serviceStatusPage: json['service_status_page'] ?? '',
      wechatPayEnabled: json['wechat_pay_enabled'] ?? false,
      enableVoiceToText: json['enable_voice_to_text'] ?? false,
      enableTextToVoice: json['enable_text_to_voice'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wechat_signin_enabled': wechatSigninEnabled,
      'apple_pay_enabled': applePayEnabled,
      'stripe_enabled': stripeEnabled,
      'wechat_pay_enabled': wechatPayEnabled,
      'other_pay_enabled': otherPayEnabled,
      'translate_enabled': translateEnabled,
      'mail_enabled': mailEnabled,
      'openai_enabled': openaiEnabled,
      'home_models': homeModels.map((e) => e.toJson()).toList(),
      'home_route': homeRoute,
      'show_home_model_description': showHomeModelDescription,
      'support_websocket': supportWebsocket,
      'support_api_keys': supportAPIKeys,
      'disable_gallery': disableGallery,
      'disable_creation_island': disableCreationIsland,
      'disable_digital_human': disableDigitalHuman,
      'disable_chat': disableChat,
      'service_status_page': serviceStatusPage,
      'enable_voice_to_text': enableVoiceToText,
      'enable_text_to_voice': enableTextToVoice,
    };
  }
}

/// 首页显示的模型信息
class HomeModel {
  /// 模型名称
  final String name;

  /// 模型 ID
  final String modelId;

  /// 模型描述
  final String desc;

  /// 模型代表色
  final String color;

  /// 是否是强大的模型
  final bool powerful;

  /// 是否支持视觉
  final bool supportVision;

  HomeModel({
    required this.name,
    required this.modelId,
    required this.desc,
    required this.color,
    this.powerful = false,
    this.supportVision = false,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        name: json["name"],
        modelId: json["model_id"],
        desc: json["desc"] ?? '',
        color: json["color"] ?? 'FF67AC5C',
        powerful: json['powerful'] ?? false,
        supportVision: json['support_vision'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model_id": modelId,
        "desc": desc,
        "color": color,
        "powerful": powerful,
        "support_vision": supportVision,
      };
}
