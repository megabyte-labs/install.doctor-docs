module.exports = {
  docs: [
    {
      type: 'category',
      label: 'Getting Started',
      collapsed: false,
      items: [
        'index',
        'main/getting-started/overview',
        'main/getting-started/requirements',
        'main/getting-started/choosing-os',
        'main/getting-started/faqs'
      ],
    },
    {
      type: 'category',
      label: 'Features',
      collapsed: false,
      items: ['features', 'integrations/cloudflare', 'integrations/kubesphere', 'integrations/tailscale', 'integrations/netdata', 'integrations/gitsync'],
    },
    {
      type: 'category',
      label: 'Customization',
      collapsed: false,
      items: [
        'main/customization/index',
        'main/customization/software',
        'main/customization/scripting',
        'main/customization/secrets',
        'main/customization/web-apps',
        'main/customization/sso'
      ],
    },
    {
      type: 'category',
      label: 'Advanced',
      collapsed: false,
      items: [
        'main/advanced/installer',
        'main/advanced/security',
        'main/advanced/network',
        'main/advanced/virtualization',
        'main/advanced/qubes'
      ],
    },
    {
      type: 'category',
      label: 'Enterprise',
      collapsed: true,
      items: [
        'main/enterprise/index',
        'main/enterprise/immutable',
        'main/enterprise/portal'
      ]
    },
    {
      type: 'category',
      label: 'Contributing',
      collapsed: true,
      items: [
        'main/contributing/index',
        'main/contributing/code-quality',
        'main/contributing/pull-requests',
        'main/contributing/feature-requests',
        'main/contributing/documentation',
        'main/contributing/community-guidelines'
      ],
    },
  ],

  api: [
    {
      type: 'category',
      label: 'Overview',
      collapsed: false,
      items: ['scripts', 'utility', 'profile', 'before', 'after'],
    },
    {
      type: 'category',
      label: 'Utility Scripts',
      collapsed: false,
      items: [
        {
          type: 'autogenerated',
          dirName: 'scripts/utility',
        },
      ],
    },
    {
      type: 'category',
      label: 'Profile Scripts',
      collapsed: false,
      items: [
        {
          type: 'autogenerated',
          dirName: 'scripts/profile',
        },
      ],
    },
    {
      type: 'category',
      label: 'Before Scripts',
      collapsed: false,
      items: [
        {
          type: 'autogenerated',
          dirName: 'scripts/before',
        },
      ],
    },
    {
      type: 'category',
      label: 'After Scripts',
      collapsed: false,
      items: [
        {
          type: 'autogenerated',
          dirName: 'scripts/after',
        },
      ],
    }
  ],
  cli: [
    {
      type: 'category',
      label: 'CLI Documentation',
      collapsed: false,
      items: ['cli/index', 'cli/taskfiles'],
    },
    {
      type: 'category',
      label: 'Commands',
      collapsed: false,
      items: [
        {
          type: 'autogenerated',
          dirName: 'cli/commands',
        },
      ],
    }
  ],
};
