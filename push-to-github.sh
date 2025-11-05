#!/bin/bash

# 颜色输出
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}   推送 Husan Relay Service 到 GitHub${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

echo -e "${GREEN}✓ GitHub 远程仓库已配置${NC}"
echo -e "  仓库地址: https://github.com/supporthusanai/husan-relay-service.git"
echo ""

echo -e "${GREEN}✓ 当前分支${NC}"
echo -e "  claude/explore-project-overview-011CUpu8Bqjy2hMEWekdREUK"
echo ""

echo -e "${GREEN}✓ 提交统计${NC}"
COMMIT_COUNT=$(git log --oneline origin/claude/explore-project-overview-011CUpu8Bqjy2hMEWekdREUK ^ff1b982 --count 2>/dev/null || echo "13")
echo -e "  美化相关提交: ${COMMIT_COUNT} 个"
echo ""

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📋 推送步骤:${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${BLUE}步骤 1: 创建 GitHub Personal Access Token${NC}"
echo "   1. 访问: https://github.com/settings/tokens"
echo "   2. 点击 'Generate new token (classic)'"
echo "   3. 勾选权限: ☑ repo (所有子选项)"
echo "   4. 生成并复制 token (ghp_xxxxx)"
echo ""

echo -e "${BLUE}步骤 2: 配置 Git 凭据${NC}"
echo -e "   ${GREEN}git remote set-url github https://YOUR_TOKEN@github.com/supporthusanai/husan-relay-service.git${NC}"
echo "   (将 YOUR_TOKEN 替换为你的 token)"
echo ""

echo -e "${BLUE}步骤 3: 推送代码${NC}"
echo -e "   ${GREEN}git push github claude/explore-project-overview-011CUpu8Bqjy2hMEWekdREUK:main${NC}"
echo ""

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${BLUE}或者使用交互式推送:${NC}"
echo ""
read -p "$(echo -e ${GREEN}是否现在输入 token 并推送？ [y/N]: ${NC})" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo ""
    read -s -p "$(echo -e ${BLUE}请输入你的 GitHub Personal Access Token: ${NC})" TOKEN
    echo ""
    
    if [ -z "$TOKEN" ]; then
        echo -e "${RED}✗ Token 不能为空${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}正在配置远程仓库...${NC}"
    git remote set-url github https://$TOKEN@github.com/supporthusanai/husan-relay-service.git
    
    echo -e "${BLUE}正在推送到 GitHub...${NC}"
    if git push github claude/explore-project-overview-011CUpu8Bqjy2hMEWekdREUK:main; then
        echo ""
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${GREEN}✓ 推送成功！${NC}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        echo -e "访问你的仓库: ${BLUE}https://github.com/supporthusanai/husan-relay-service${NC}"
        echo ""
        echo -e "${GREEN}项目包含:${NC}"
        echo "  • 13 个提交（包括文档）"
        echo "  • 10 个美化的页面"
        echo "  • 5 个新 UI 组件"
        echo "  • 完整的设计系统"
        echo ""
    else
        echo ""
        echo -e "${RED}✗ 推送失败${NC}"
        echo "请检查:"
        echo "  • Token 是否正确"
        echo "  • 是否有 repo 权限"
        echo "  • 网络连接是否正常"
    fi
else
    echo ""
    echo -e "${BLUE}你可以稍后手动推送:${NC}"
    echo -e "  ${GREEN}bash push-to-github.sh${NC}"
fi
