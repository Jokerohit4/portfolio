part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    // SocialButtonData(
    //   tag: StringConst.FACEBOOK_URL,
    //   iconData: FontAwesomeIcons.facebook,
    //   url: StringConst.FACEBOOK_URL,
    // ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    // SocialButtonData(
    //   tag: StringConst.INSTAGRAM_URL,
    //   iconData: FontAwesomeIcons.instagram,
    //   url: StringConst.INSTAGRAM_URL,
    // ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
    //TODO
    // SocialButton2Data(
    //   title: StringConst.DRIBBLE,
    //   iconData: FontAwesomeIcons.dribbble,
    //   url: StringConst.DRIBBLE_URL,
    //   titleColor: AppColors.pink300,
    //   buttonColor: AppColors.pink300,
    //   iconColor: AppColors.white,
    // ),
    // SocialButton2Data(
    //   title: StringConst.INSTA,
    //   iconData: FontAwesomeIcons.instagram,
    //   url: StringConst.INSTAGRAM_URL,
    //   titleColor: AppColors.yellow300,
    //   buttonColor: AppColors.yellow300,
    //   iconColor: AppColors.white,
    // ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.SKILLS_1,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_4,
      level: 60,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_5,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_6,
      level: 70,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_7,
      level: 70,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_2,
      level: 40,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_3,
      level: 10,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_8,
      level: 10,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_9,
      level: 10,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: FontAwesomeIcons.flutter,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: FontAwesomeIcons.paintBrush,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.recordVinyl,
    ),
    SkillCardData(title: "", description: "", iconData: Icons.pages_outlined),
    SkillCardData(
      title: StringConst.SKILLS_6,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.android,
    ),
    SkillCardData(
        title: StringConst.SKILLS_8,
        description: "",
        iconData: FontAwesomeIcons.nodeJs),
    SkillCardData(
      title: StringConst.SKILLS_7,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.appStoreIos,
    ),
    SkillCardData(
        title: StringConst.SKILLS_9,
        description: "",
        iconData: FontAwesomeIcons.java),
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 14, subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(value: 05, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 28, subtitle: StringConst.INCREDIBLE_PROJECTS),
    //StatItemData(value: 18, subtitle: StringConst.AWARD_WINNING), //TODO
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(
        title: StringConst.ALL, number: allProjects.length, isSelected: true),
    ProjectCategoryData(title: StringConst.WIOM, number: wiom.length),
    ProjectCategoryData(title: StringConst.REAL_SOL, number: realSol.length),
    ProjectCategoryData(title: StringConst.NEO_DOCS, number: neodocs.length),
    ProjectCategoryData(title: StringConst.GMAGICA, number: gmagica.length),
    ProjectCategoryData(
        title: StringConst.PERSONAL_PROJECTS, number: personalProjects.length),
  ];

  static List<String> hobbies1 = [
    StringConst.HOBBY_1,
    StringConst.HOBBY_2,
    StringConst.HOBBY_3,
    StringConst.HOBBY_4,
    StringConst.HOBBY_5,
  ];
  static List<String> hobbies2 = [
    StringConst.HOBBY_6,
    StringConst.HOBBY_7,
    StringConst.HOBBY_8,
    StringConst.HOBBY_9,
    StringConst.HOBBY_10,
  ];

  static List<String> awards1 = [
    StringConst.AWARDS_1,
    StringConst.AWARDS_2,
    StringConst.AWARDS_3,
    StringConst.AWARDS_4,
    StringConst.AWARDS_5,
  ];
  static List<String> awards2 = [
    StringConst.AWARDS_6,
    StringConst.AWARDS_7,
    StringConst.AWARDS_8,
    StringConst.AWARDS_9,
    StringConst.AWARDS_10,
  ];
  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_01,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_2,
      title: StringConst.BLOG_TITLE_2,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_02,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_3,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_03,
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: StringConst.JOB_ROLE,
      subtitle: StringConst.MOBILE_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: StringConst.DESIGNER,
      subtitle: StringConst.DESIGNER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    NimBusCardData(
      title: StringConst.FREELANCER,
      subtitle: StringConst.FREELANCER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  static List<ProjectData> allProjects = [
    ProjectData(
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ONE,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ZERO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.LMS_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_LMS,
      width: 0.225,
      link: StringConst.LMS_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ONE,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ZERO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ONE,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
      title: StringConst.MOOV_MONEY_TOGO,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_TOGO_LINK,
    ),
    ProjectData(
      title: StringConst.MOOV_MONEY_CI,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_CI,
      width: 0.225,
      link: StringConst.MOOV_MONEY_CI_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    )
  ];

  static List<ProjectData> wiom = [
    ProjectData(
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_TWO,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_TWO_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ZERO,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ONE,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ZERO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ONE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_TWO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_THREE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_FOUR,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_FIVE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      title: StringConst.LMS_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_LMS,
      width: 0.225,
      link: StringConst.LMS_WIOM_LINK,
    ),
  ];

  static List<ProjectData> realSol = [
    ProjectData(
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ZERO,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ONE,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ZERO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ONE,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_TWO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
  ];

  static List<ProjectData> neodocs = [
    ProjectData(
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_TWO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ZERO,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ONE,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
        title: StringConst.INSTANT_MALARIA_DENGUE,
        category: StringConst.NEO_DOCS,
        projectCoverUrl: ImagePath.NEODOCS_MALARIA_ONE,
        width: 0.475,
        mobileHeight: 0.3,
        link: StringConst.INSTANT_MALARIA_DENGUE_LINK),
    ProjectData(
        title: StringConst.INSTANT_MALARIA_DENGUE,
        category: StringConst.NEO_DOCS,
        projectCoverUrl: ImagePath.NEODOCS_MALARIA_ZERO,
        width: 0.475,
        mobileHeight: 0.3,
        link: StringConst.INSTANT_MALARIA_DENGUE_LINK),
  ];

  static List<ProjectData> gmagica = [
    ProjectData(
      title: StringConst.MOOV_MONEY_BENIN,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_BENIN_LINK,
    ),
    ProjectData(
      title: StringConst.MOOV_MONEY_TOGO,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_CI,
      width: 0.225,
      link: StringConst.MOOV_MONEY_TOGO_LINK,
    ),
    ProjectData(
      title: StringConst.MOOV_MONEY_CI,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_CI_LINK,
    ),
  ];

  static List<ProjectData> personalProjects = [
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ZERO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_TWO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_THREE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_FOUR,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_FIVE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    )
  ];
}
