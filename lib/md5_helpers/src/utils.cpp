#include "md5_helpers/utils.h"

#include <Poco/DigestStream.h>
#include <Poco/MD5Engine.h>

std::string getHex()
{
    Poco::MD5Engine md5;
    Poco::DigestOutputStream ds(md5);
    ds << "abcdefghijklmnopqrstuvwxyz";
    ds.close();
    return Poco::DigestEngine::digestToHex(md5.digest());
}
