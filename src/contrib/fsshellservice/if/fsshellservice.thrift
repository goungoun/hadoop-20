#!/usr/local/bin/thrift -java

namespace java org.apache.hadoop.hdfs.fsshellservice
namespace php fsshellservice
namespace py fsshellservice

struct DfsFileStatus {
  1: required string path,
  2: required i64 length,
  3: required bool isdir,
  4: required i64 modification_time,
  5: required i64 access_time,
}

exception FsshellException {
  1: string message
}

service FsshellService
{
  void copyFromLocal(1:string src, 2:string dest)
      throws (1:FsshellException e),
  void copyToLocal(1:string src, 2:string dest)
      throws (1:FsshellException e),
  bool remove(1:string path, 2:bool recursive)
      throws (1:FsshellException e),
  bool mkdirs(1:string f)
      throws (1:FsshellException e),
  bool rename(1:string src, 2:string dest)
      throws (1:FsshellException e),
  list<DfsFileStatus> listStatus(1:string path)
      throws (1:FsshellException e),
}
