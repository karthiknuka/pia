package ECC;
import java.math.BigInteger; 
import java.security.*;

import java.security.spec.*;
public class ECCSignature
{
	String pubkey,prikey;
	byte[] privateKeyBytes;  byte[] publicKeyBytes;
public void keyGeneration() throws Exception {
KeyPairGenerator kpg;
kpg = KeyPairGenerator.getInstance("EC","SunEC");
ECGenParameterSpec ecsp;
ecsp = new ECGenParameterSpec("sect163k1");
kpg.initialize(ecsp);
KeyPair kp = kpg.genKeyPair();
PrivateKey privKey = kp.getPrivate();
PublicKey pubKey = kp.getPublic();
System.out.println(privKey.toString());
System.out.println(pubKey.toString());
   privateKeyBytes = privKey.getEncoded();
   publicKeyBytes = pubKey.getEncoded();
setPubkey(pubKey.toString());setPrikey(privKey.toString());
setPk(publicKeyBytes);
setSk(privateKeyBytes);

}
public void setPubkey(String pubkey){
	this.pubkey = pubkey;
  }
  public void setPrikey(String prikey){
	this.prikey = prikey;
  }
 public String getPubkey(){
  return pubkey;
  }
 public String getPrikey(){
  return prikey;
  }
public void setPk(byte[] publicKeyBytes){
	this.publicKeyBytes =publicKeyBytes;
  }
  public void setSk(byte[] privateKeyBytesy){
	this.privateKeyBytes = privateKeyBytes ;
  }
 public byte[] getPk(){
  return publicKeyBytes;
  }
 public byte[] getSk(){
  return privateKeyBytes ;
  }
}