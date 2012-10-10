require 'spec_helper'

describe Vmstat::Snapshot do
  context "Vmstat#snapshot" do
    let(:snapshot) { Vmstat.snapshot }
    subject { snapshot }

    it "should be an vmstat load snapshot object" do
      should be_a(Vmstat::Snapshot)
    end

    context "methods" do
      it { should respond_to(:at) }
      it { should respond_to(:boot_time) }
      it { should respond_to(:cpu) }
      it { should respond_to(:disks) }
      it { should respond_to(:load_average) }
      it { should respond_to(:memory) }
      it { should respond_to(:network_interfaces) }
      it { should respond_to(:task) }
    end

    context "content" do
      its(:at) { should be_a(Time) }
      its(:boot_time) { should be_a(Time) }
      its(:cpu) { should be_a(Array) }
      its(:disks) { should be_a(Array) }
      its(:load_average) { should be_a(Vmstat::LoadAverage) }
      its(:memory) { should be_a(Vmstat::Memory) }
      its(:network_interfaces) { should be_a(Array) }
      its(:task) { should be_a(Vmstat::Task) }

      context "first of cpu" do
        subject { snapshot.cpu.first }
        it { should be_a(Vmstat::Cpu) }
      end
      
      context "first of disks" do
        subject { snapshot.disks.first }
        it { should be_a(Vmstat::Disk) }
      end

      context "first of network interfaces" do
        subject { snapshot.network_interfaces.first }
        it { should be_a(Vmstat::NetworkInterface) }
      end
    end
  end
end