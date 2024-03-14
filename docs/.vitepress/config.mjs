import { defineConfig } from "vitepress";
import jsonData from './data.json';

export default defineConfig({
  lang: 'en-US',
  base:'/VitePressSite/',
  title: "My Awesome Project",
  description: "A VitePress Site",
  appearance: true,
  ignoreDeadLinks: true,
  lastUpdated: true,
  cleanUrls:true,
  sidebar: false,
  markdown: {
    lineNumbers: true,
  },
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        locales: {
          zh: {
            translations: {
              button: {
                buttonText: '搜索文档',
                buttonAriaLabel: '搜索文档'
              },
              modal: {
                noResultsText: '无法找到相关结果',
                resetButtonTitle: '清除查询条件',
                footer: {
                  selectText: '选择',
                  navigateText: '切换'
                }
              }
            }
          }
        }
      }
    },
    nav: [
      { text: "Home", link: "/" },
      { text: "Examples", link: "/markdown-examples" },
      {
        text: "Dropdown Menu",
        items: [
          { text: "Item A", link: "/item-1" },
          { text: "Item B", link: "/item-2" },
          { text: "Item C", link: "/item-3" },
        ],
      },
    ],
  sidebar: jsonData,
  socialLinks: [
      { icon: "github", link: "https://github.com/GitHubAsural/VitePressDocs" },
    ],
  },
});
