#!/usr/bin/python
# -*- coding: utf-8 -*-
# unfinished issue: add dir depth limited.

import os
import sys
import argparse


class DirTree:
	def __init__(self, directory):
		self.dircount = 0
		self.filecount = 0
		self.directory = directory

	def register(self, absolute):
		if os.path.isdir(absolute):
			self.dircount += 1
		else:
			self.filecount += 1

	def summary(self):
		return str(self.dircount) + " directories, " + str(self.filecount) + " files"

	def walk(self, directory, prefix=""):
		filepaths = sorted([filepath for filepath in os.listdir(directory)])

		for index in range(len(filepaths)):
			if filepaths[index][0] == ".":
				continue

			absolute = os.path.join(directory, filepaths[index])
			self.register(absolute)

			if index == len(filepaths) - 1:
				print(prefix + "└── " + filepaths[index])
				if os.path.isdir(absolute):
					self.walk(absolute, prefix + "    ")
			else:
				print(prefix + "├── " + filepaths[index])
				if os.path.isdir(absolute):
					self.walk(absolute, prefix + "│   ")

	def generate(self):
		print(self.directory)
		self.walk(self.directory)
		print("\n" + self.summary())


class MarkdownTree:
	def __init__(self, filename):
		self.dircount = 0
		self.filecount = 0
		self.titleTree = {}
		self.filename = filename

	def register(self):
		with open(self.filename, 'r') as file:
			lastNode = {}
			currentPriorNodeDict = {}  # using to find the prior node by recording all the current prior node at all levels
			commitCheckingPoint = 0  # avoid commit in code block surrounded by ```
			for line in file:
				if "```" in line:
					commitCheckingPoint ^= 1
					continue
				if commitCheckingPoint == 1:
					continue

				titlecount = 0
				for char in line:
					if char == '#':
						titlecount += 1
					else:
						break

				if titlecount != 0:
					tempNode = {"rank": titlecount, "title": line[titlecount + 1:].strip(), "children": []}

					if self.titleTree == {}:
						if tempNode["rank"] == 1:
							self.titleTree = tempNode
							currentPriorNodeDict[titlecount] = tempNode
						else:
							self.titleTree = {"rank": 1, "title": "No Title", "children": []}
							currentPriorNodeDict[1] = self.titleTree
							for i in range(2, titlecount):
								fakeNode = {"rank": i, "title": "┐", "children": []}
								currentPriorNodeDict[i - 1]["children"].append(fakeNode)
								currentPriorNodeDict[i] = fakeNode
							currentPriorNodeDict[titlecount - 1]["children"].append(tempNode)
							currentPriorNodeDict[titlecount] = tempNode

					else:
						if titlecount < lastNode["rank"]:
							currentPriorNodeDict[titlecount - 1]["children"].append(tempNode)
							currentPriorNodeDict[titlecount] = tempNode
							# update currentPriorNodeDict to delete low rank node
							currentPriorNodeDict = {key: currentPriorNodeDict[key] for key in currentPriorNodeDict if
							                        key <= titlecount}
						elif titlecount == lastNode["rank"]:
							currentPriorNodeDict[titlecount - 1]["children"].append(tempNode)
							currentPriorNodeDict[titlecount] = tempNode
						elif titlecount > lastNode["rank"]:
							if titlecount - lastNode["rank"] == 1:
								currentPriorNodeDict[titlecount - 1]["children"].append(tempNode)
								currentPriorNodeDict[titlecount] = tempNode
							else:
								# script will hit this when the rank difference between titlerank & lastnode is more than one, because you need to fill fake node.
								tempRank = lastNode["rank"]
								for i in range(1, titlecount - tempRank):
									fakeNode = {"rank": tempRank + i, "title": "┐", "children": []}
									currentPriorNodeDict[tempRank + i - 1]["children"].append(fakeNode)
									currentPriorNodeDict[tempRank + i] = fakeNode
								currentPriorNodeDict[titlecount - 1]["children"].append(tempNode)
								currentPriorNodeDict[titlecount] = tempNode

						else:
							print("Error Occurs! Have no idea.")
					lastNode = tempNode
			try:
				print(self.titleTree["title"])  # print first title
			except Exception:
				print("***Error Occurs!***:")
				print(
					"Please make sure input file satisfied markdowm format. At least it should hava one markdown title. : )")
				return
			# print("│")
			self.walk(self.titleTree)

	def walk(self, node, prefix=""):
		if node["children"] != []:
			count = 0
			for child in node["children"]:
				count += 1
				if count == len(node["children"]):
					print(prefix + "└───" + child["title"])
					if child["children"] != []:
						self.walk(child, prefix + "    ")
				else:
					print(prefix + "├───" + child["title"])
					if child["children"] != []:
						self.walk(child, prefix + "│   ")


if __name__ == '__main__':

	parser = argparse.ArgumentParser()
	parser.add_argument('-t', '--type', dest='type', type=str, choices=['markdown', 'dir'], default='markdown',
	                    help='document type')
	parser.add_argument(dest='target', type=str, help='file/directory')
	args = parser.parse_args()
	if args.type == 'markdown':
		if os.path.isfile(args.target):
			if args.target.endswith('.markdown') or args.target.endswith('.md'):
				tree = MarkdownTree(args.target)
				tree.register()
			else:
				print('Error: Invaild file type. File suffix should be ".md" or ".markdown".')
				exit()
		else:
			print('Error: Input target is not a file or file does not exist.')
			exit()

	if args.type == 'dir':
		if os.path.isdir(args.target):
			tree = DirTree(args.target)
			tree.generate()
		else:
			print("Error: Invaild directory path.")
			exit()