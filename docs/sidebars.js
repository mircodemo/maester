// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  siteSidebar: [
    "intro",
    "writing-tests",
    {
      type: "category",
      label: "Daily Automation",
      collapsed: false,
      collapsible: false,
      items: [{ type: "autogenerated", dirName: "automation" }],
    },
    "contributing",
    {
      type: "html",
      value: '<span class="sidebar-divider" />',
    },
    {
      type: "category",
      label: "Test Reference",
      collapsed: false,
      collapsible: false,
      items: [
        "tests/overview",
        {
          type: "category",
          label: "Maester",
          collapsed: false,
          collapsible: false,
          items: [
            "tests/maester-overview",
            { type: "autogenerated", dirName: "tests/maester" },
          ],
        },
        {
          type: "category",
          label: "Entra ID SCA",
          collapsed: false,
          collapsible: false,
          items: [
            {
              type: "doc",
              id: "tests/eidsca-overview",
            },
            { type: "autogenerated", dirName: "tests/eidsca" },
          ],
        },
      ],
    },
    {
      type: "category",
      label: "Command Reference",
      collapsed: false,
      collapsible: false,
      items: [
        "commands-overview",
        { type: "autogenerated", dirName: "commands" },
      ],
    },
  ],
};

export default sidebars;
